import 'package:flutter/material.dart';
import 'package:tracking_app/models/auth/sign_up_dto.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/screens/auth/verify_screen.dart';
import 'package:tracking_app/services/auth_service.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_date_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_numbers_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_dropdown_gender_widget.dart';
import 'package:tracking_app/widgets/auth/register/register_background_widget.dart';

class RegisterPersonalBodyWidget extends StatefulWidget {
  final String email;
  final String password;
  const RegisterPersonalBodyWidget(
      {Key? key, required this.password, required this.email})
      : super(key: key);

  @override
  State<RegisterPersonalBodyWidget> createState() =>
      _RegisterPersonalBodyWidgetState();
}

class _RegisterPersonalBodyWidgetState
    extends State<RegisterPersonalBodyWidget> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _birthdateController = TextEditingController(text: "13/06/1999");
  // Controller for Address
  final _addressTownController = TextEditingController();
  final _addressZIPController = TextEditingController();
  final _addressStreetController = TextEditingController();

  final _projectTokenController = TextEditingController();

  String? gender;

  // Function to pass to set the state of gender
  void _setGender(String dropDownValue) {
    setState(() {
      gender = dropDownValue;
    });
  }

  Future<void> _signUp() async {
    //First check if lastname and firstname are not empty
    if (_firstNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("First- and Lastname should not be empty!"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }

    if (_projectTokenController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Project Code can't be empty!"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }

    //Create a full Address
    final String fullAddress =
        "${_addressZIPController.text.trim()} ${_addressTownController.text.trim()}, ${_addressStreetController.text.trim()}";

    //Parse only if its not empty
    final int? parsedHeight = _heightController.text.trim().isNotEmpty
        ? int.parse(_heightController.text.trim())
        : null;

    final int? parsedWeight = _weightController.text.trim().isNotEmpty
        ? int.parse(_weightController.text.trim())
        : null;

    // Validate Height and Weight
    if (parsedHeight != null && (parsedHeight <= 120 || parsedHeight >= 230)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Please use a valid Height in cm"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));

      return;
    }

    if (parsedWeight != null && (parsedWeight <= 35 || parsedWeight >= 230)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Please use a valid Weight in cm"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));

      return;
    }

    final String? parsedGender =
        gender == "---" || gender == null ? null : gender!.toUpperCase();

    DateTime? dateTime;
    if (_birthdateController.text.trim().isNotEmpty) {
      List<String> dateSplitted = _birthdateController.text.trim().split("/");
      dateTime = DateTime(int.parse(dateSplitted[2]),
          int.parse(dateSplitted[1]), int.parse(dateSplitted[0]));
    }

    final DateTime? birthdayDateTime =
        _birthdateController.text.trim().isNotEmpty ? dateTime : null;

    final int? parsedBirthday = birthdayDateTime?.millisecondsSinceEpoch;

    SignUpDto dto = SignUpDto(
        email: widget.email,
        password: widget.password,
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        address: fullAddress,
        gender: parsedGender,
        birthday: parsedBirthday,
        height: parsedHeight,
        weight: parsedWeight,
        projectToken: _projectTokenController.text.trim());

    int res = await const AuthService().signUp(dto);

    if (!mounted) return;

    if (res == 201) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const VerifyScreen();
      }));
    } else if (res == 409) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Account with Email already exists"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Error - Check Project Code"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegisterBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("For our Study,",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const Text("Personal Information",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          const SizedBox(
            height: 25,
          ),
          InputFieldWidget(
              hintText: "Firstname",
              icon: Icons.person,
              inputController: _firstNameController,
              keyboardtType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
              hintText: "Lastname",
              icon: Icons.family_restroom,
              inputController: _lastNameController,
              keyboardtType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
              hintText: "Project Code",
              icon: Icons.code,
              inputController: _projectTokenController,
              keyboardtType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          const Text("Optional",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InputFieldDateWidget(
                inputController: _birthdateController,
                inputWidth: 0.45,
              ),
              RoundedDropdownGenderWidget(setGender: _setGender),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Address",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InputFieldWidget(
                hintText: "Town",
                icon: Icons.home,
                inputController: _addressTownController,
                keyboardtType: TextInputType.text,
                inputWidth: 0.4,
              ),
              InputFieldWidget(
                hintText: "ZIP",
                icon: Icons.location_on,
                inputController: _addressZIPController,
                keyboardtType: TextInputType.number,
                inputWidth: 0.3,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
            hintText: "Street, no.",
            icon: Icons.add_location_alt,
            inputController: _addressStreetController,
            keyboardtType: TextInputType.streetAddress,
            inputWidth: 0.8,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InputFieldNumbersWidget(
                hintText: "Height",
                icon: Icons.height,
                inputController: _heightController,
                keyboardtType: TextInputType.number,
                inputWidth: 0.4,
                labelText: "cm",
              ),
              InputFieldNumbersWidget(
                hintText: "Weight",
                icon: Icons.scale,
                inputController: _weightController,
                keyboardtType: TextInputType.number,
                inputWidth: 0.36,
                labelText: "kg",
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: 'Sign Up',
              onPress: () {
                _signUp();
              },
              color: accentColor,
              textColor: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Already have an account?  ",
                  style: TextStyle(color: accentColor)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                child: const Text(
                  "Click here",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: accentColor),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
