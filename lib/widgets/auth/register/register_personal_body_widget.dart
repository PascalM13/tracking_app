import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tracking_app/models/auth/sign_up_dto.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/services/auth_service.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_date_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_dropdown_gender_widget.dart';
import 'package:tracking_app/widgets/auth/register/register_background_widget.dart';

class RegisterPersonalBodyWidget extends StatefulWidget {
  final email;
  final password;
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

  String? gender;

  // Function to pass to set the state of gender
  void _setGender(String dropDownValue) {
    setState(() {
      gender = dropDownValue;
    });
  }

  Future<void> _signUp() async {
    final String fullAddress =
        "${_addressZIPController.text.trim()} ${_addressTownController.text.trim()}, ${_addressStreetController.text.trim()}";
    SignUpDto dto = SignUpDto(
      email: widget.email,
      password: widget.password,
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      address: fullAddress,
      gender: gender,
      //birthday: _birthdateController.text.trim(), //TODO Convert to Int?
      height: int.parse(_heightController.text.trim()),
      weight: int.parse(_weightController.text.trim()),
    );

    int res = await const AuthService().signUp(dto);

    if (!mounted) return;

    if (res == 201) {
      //TODO Screen für Validierung
    } else if (res == 409) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Account already exists"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Error - Please fill out all mandatory fields"),
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
              inputController: _lastNameController,
              keyboardtType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
              hintText: "Lastname",
              icon: Icons.family_restroom,
              inputController: _firstNameController,
              keyboardtType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InputFieldDateWidget(
                inputController: _birthdateController,
                inputWidth: 0.4,
              ),
              RoundedDropdownGenderWidget(setGender: _setGender),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Address",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const SizedBox(
            height: 15,
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
          const Text("Optional",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InputFieldWidget(
                hintText: "Height(cm)",
                icon: Icons.height,
                inputController: _heightController,
                keyboardtType: TextInputType.number,
                inputWidth: 0.4,
              ),
              InputFieldWidget(
                hintText: "Weight(kg)",
                icon: Icons.scale,
                inputController: _weightController,
                keyboardtType: TextInputType.number,
                inputWidth: 0.36,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: 'Sign Up',
              onPress: () {
                //TODO: SignUp Service needs to be created
                log("No logic implemented at 'register_personal_body_widget'");
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
