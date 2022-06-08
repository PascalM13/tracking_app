import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/auth/login/login_body_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBodyWidget(),
    );
  }
}
