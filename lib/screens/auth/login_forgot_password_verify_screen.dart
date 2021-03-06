import 'package:flutter/material.dart';

import '../../widgets/auth/login/login_forgot_password_verify_body_widget.dart';

///Screen for verifying the password while login, where the widget is opened
class LoginForgotPasswordVerifyScreen extends StatefulWidget {
  const LoginForgotPasswordVerifyScreen({Key? key}) : super(key: key);

  @override
  State<LoginForgotPasswordVerifyScreen> createState() =>
      _LoginForgotPasswordVerifyScreenState();
}

class _LoginForgotPasswordVerifyScreenState
    extends State<LoginForgotPasswordVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForgotPasswordVerifyBodyWidget(),
    );
  }
}
