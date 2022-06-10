import 'package:flutter/material.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_dropdown_gender_widget.dart';
import 'package:tracking_app/widgets/auth/register/register_background_widget.dart';

import '../../UI/input_fields/input_field_email_widget.dart';
import '../../UI/input_fields/input_field_password_widget.dart';

class RegisterBodyWidget extends StatefulWidget {
  const RegisterBodyWidget({Key? key}) : super(key: key);

  @override
  State<RegisterBodyWidget> createState() => _RegisterBodyWidgetState();
}

class _RegisterBodyWidgetState extends State<RegisterBodyWidget> {
  String? gender;

  // Function to pass to set the state of gender
  void _setGender(String dropDownValue) {
    setState(() {
      gender = dropDownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RegisterBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Hey there,",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const Text("Sign up here!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          const SizedBox(
            height: 25,
          ),
          const InputFieldWidget(
            hintText: "Vorname",
            icon: Icons.person,
          ),
          const SizedBox(
            height: 15,
          ),
          const InputFieldWidget(
            hintText: "Nachname",
            icon: Icons.person,
          ),
          const SizedBox(
            height: 15,
          ),
          const InputFieldEmailWidget(),
          const SizedBox(
            height: 15,
          ),
          const InputFieldPasswordWidget(),
          const SizedBox(
            height: 10,
          ),
          const Text("Optional",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const SizedBox(
            height: 10,
          ),
          const InputFieldWidget(
            hintText: "Adresse",
            icon: Icons.house,
          ),
          RoundedDropdownGenderWidget(setGender: _setGender),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: 'Sign Up',
              onPress: () {
                print(gender);
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
