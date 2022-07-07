import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/services/user_service.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_date_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_dropdown_gender_widget.dart';

import '../../../models/user/user_model.dart';

class ProfileChangeWidget extends StatefulWidget {
  const ProfileChangeWidget({Key? key}) : super(key: key);

  @override
  State<ProfileChangeWidget> createState() => _ProfileChangeWidgetState();
}

class _ProfileChangeWidgetState extends State<ProfileChangeWidget> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _birthdateController = TextEditingController(text: "13/06/1999");
  // Controller for Address
  final _addressTownController = TextEditingController();
  final _addressZIPController = TextEditingController();
  final _addressStreetController = TextEditingController();
  final _addressController = TextEditingController();

  String? gender;

  String _firstname = '';
  String _lastname = '';
  String _dateofbirth = '';

  String _address = '';
  String _height = '';
  String _weight = '';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    UserModel tmp = await UserModel().getCurrentUser();
    setState(() {
      if (tmp.firstName == null || tmp.firstName == '') {
        _firstname = 'Firstname';
      } else {
        _firstname = tmp.firstName.toString();
      }
      if (tmp.lastName == null || tmp.lastName == '') {
        _lastname = 'Lastname';
      } else {
        _lastname = tmp.lastName.toString();
      }
      if (tmp.birthday == null) {
        _dateofbirth = 'Date of birth';
      } else {
        _dateofbirth = tmp.birthday.toString();
      }

      if (tmp.address == null) {
        _address = 'Address';
      } else {
        _address = tmp.address.toString();
      }

      if (tmp.height == null) {
        _height = 'Height(cm)';
      } else {
        _height = '${tmp.height} cm';
      }
      if (tmp.weight == null) {
        _weight = 'Weight(kg)';
      } else {
        _weight = '${tmp.weight} kg';
      }
    });
  }

  // Function to pass to set the state of gender
  void _setGender(String dropDownValue) {
    setState(() {
      gender = dropDownValue;
    });
  }

  Future<void> _updateUserInfo() async {
    //Parse only if its not empty
    final int? parsedHeight = _heightController.text.trim().isNotEmpty
        ? int.parse(_heightController.text.trim())
        : null;

    final int? parsedWeight = _weightController.text.trim().isNotEmpty
        ? int.parse(_weightController.text.trim())
        : null;

    final String? parsedGender =
        gender == "---" || gender == null ? null : gender!.toUpperCase();

    if (_firstNameController.text.isNotEmpty) {
      UserModel userInfos = await UserService()
          .updateUser({"firstName": _firstNameController.text.trim()});
    }
    if (_lastNameController.text.isNotEmpty) {
      UserModel userInfos = await UserService()
          .updateUser({"lastName": _lastNameController.text.trim()});
    }
    if (parsedGender != '' || parsedGender != null) {
      UserModel userInfos =
          await UserService().updateUser({"gender": parsedGender});
    }
    if (_addressController.text.isNotEmpty) {
      UserModel userInfos = await UserService()
          .updateUser({"address": _addressController.text.trim()});
    }
    if (_heightController.text.isNotEmpty) {
      UserModel userInfos = await UserService()
          .updateUser({"height": int.parse(_heightController.text.trim())});
    }
    if (_weightController.text.isNotEmpty) {
      UserModel userInfos = await UserService()
          .updateUser({"weight": int.parse(_weightController.text.trim())});
    }
  }

  //Function to chance the profile
  void _changeProfile() {
    setState(() {
      _getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "My Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          const SizedBox(
            height: 25,
          ),
          InputFieldWidget(
              hintText: _firstname,
              icon: Icons.person,
              inputController: _firstNameController,
              keyboardtType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
              hintText: _lastname,
              icon: Icons.family_restroom,
              inputController: _lastNameController,
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
          InputFieldWidget(
            hintText: _address,
            icon: Icons.add_location_alt,
            inputController: _addressController,
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
                hintText: _height,
                icon: Icons.height,
                inputController: _heightController,
                keyboardtType: TextInputType.number,
                inputWidth: 0.4,
              ),
              InputFieldWidget(
                hintText: _weight,
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
              text: 'Save information',
              onPress: () async {
                //TODO: Profile Service needs to be created
                log("No logic implemented at 'profile_body_widget'");
                _updateUserInfo();
                _changeProfile();
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const NavScreen();
                }));
              },
              color: accentColor,
              textColor: Colors.white),
        ],
      ),
    ));
  }
}
