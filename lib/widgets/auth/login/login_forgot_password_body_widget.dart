import 'package:flutter/material.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_Button_widget.dart';
import 'package:tracking_app/widgets/auth/login/login_forgot_password_background_widget.dart';

class LoginForgotPasswordBodyWidget extends StatefulWidget {
  const LoginForgotPasswordBodyWidget({Key? key}) : super(key: key);

  @override
  State<LoginForgotPasswordBodyWidget> createState() =>
      _LoginForgotPasswordBodyWidgetState();
}

class _LoginForgotPasswordBodyWidgetState
    extends State<LoginForgotPasswordBodyWidget> {
  final _emailController = TextEditingController();
  final _emailVerificationController = TextEditingController();

  void _resetPassword() {
    //TODO Check if Account with Email exists
    //if (emailExists() != true) return;

    //Check if email == emailVerification
    if (_emailController.text != _emailVerificationController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Both Emails need to be the same"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }
    // TODO: Send a Request to change the password of the User
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: const Text("A new Password has been sent to your Email!"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 10),
      ));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return LoginForgotPasswordBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const Text("Forgot your Password?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          const Text("No worries!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const SizedBox(
            height: 20,
          ),
          InputFieldWidget(
              hintText: 'E-Mail',
              icon: Icons.email,
              inputController: _emailController,
              keyboardtType: TextInputType.emailAddress),
          const SizedBox(
            height: 20,
          ),
          InputFieldWidget(
              hintText: 'E-Mail again',
              icon: Icons.email,
              inputController: _emailVerificationController,
              keyboardtType: TextInputType.emailAddress),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: "Request new Password",
              onPress: _resetPassword,
              color: accentColor,
              textColor: Colors.white)
        ],
      ),
    ));
  }
}
