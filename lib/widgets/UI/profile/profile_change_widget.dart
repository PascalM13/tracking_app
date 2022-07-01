import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_date_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_dropdown_gender_widget.dart';

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

  String? gender;

  // Function to pass to set the state of gender
  void _setGender(String dropDownValue) {
    setState(() {
      gender = dropDownValue;
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
              text: 'Save information',
              onPress: () {
                //TODO: Profile Service needs to be created
                log("No logic implemented at 'profile_body_widget'");

                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
