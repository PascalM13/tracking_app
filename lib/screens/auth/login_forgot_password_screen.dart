import 'package:flutter/material.dart';

import '../../widgets/auth/login/login_forgot_password_body_widget.dart';

class LoginForgotPasswordScreen extends StatefulWidget {
  const LoginForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<LoginForgotPasswordScreen> createState() =>
      _LoginForgotPasswordScreenState();
}

class _LoginForgotPasswordScreenState extends State<LoginForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForgotPasswordBodyWidget(),
    );
  }
}
