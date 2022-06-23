import 'package:flutter/material.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/auth/register/register_background_widget.dart';

import '../../../screens/auth/register_personal_screen.dart';

class RegisterBodyWidget extends StatefulWidget {
  const RegisterBodyWidget({Key? key}) : super(key: key);

  @override
  State<RegisterBodyWidget> createState() => _RegisterBodyWidgetState();
}

class _RegisterBodyWidgetState extends State<RegisterBodyWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordValidatorController = TextEditingController();

  void _validateEmailAndPassword() {
    //Validate our Email
    if (_emailController.text.isEmpty) {
      //TODO: Check if email already exists with Service
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Wrong credentials"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }
    //Check if every field is filled
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordValidatorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Please fill out all field!"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }

    //If both password are equals, we can redirect the user
    if (_passwordController.text != _passwordValidatorController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Password need to be equal!"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return RegisterPersonalScreen(
          email: _emailController.text, password: _passwordController.text);
    }));
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
          InputFieldWidget(
              hintText: "Email",
              icon: Icons.mail,
              inputController: _emailController,
              keyboardtType: TextInputType.emailAddress),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
              hintText: "Password",
              icon: Icons.lock,
              inputController: _passwordController,
              keyboardtType: TextInputType.text,
              isPassword: true),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
              hintText: "Repeat Password",
              icon: Icons.lock,
              inputController: _passwordValidatorController,
              keyboardtType: TextInputType.text,
              isPassword: true),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: 'Next',
              onPress: () {
                _validateEmailAndPassword();
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
