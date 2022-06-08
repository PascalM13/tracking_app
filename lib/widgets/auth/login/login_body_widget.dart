import 'package:flutter/material.dart';
import 'package:tracking_app/screens/auth/welcome_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/auth/login/login_background_widget.dart';

import '../../UI/input_field_email_widget.dart';
import '../../UI/input_field_password_widget.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Hey there,",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const Text("Welcome Back!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          Image.asset(
            'assets/images/login_screen.jpg',
            height: size.height * 0.3,
          ),
          const InputFieldEmailWidget(),
          const SizedBox(
            height: 15,
          ),
          const InputFieldPasswordWidget(),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: 'Login',
              onPress: () {},
              color: accentColor,
              textColor: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Don't have an account?  ",
                  style: TextStyle(color: accentColor)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const WelcomeScreen(); //TODO: Needs to be wired up with Sign UP
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
