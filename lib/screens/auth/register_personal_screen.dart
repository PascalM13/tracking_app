import 'package:flutter/material.dart';

import '../../widgets/auth/register/register_personal_body_widget.dart';

class RegisterPersonalScreen extends StatelessWidget {
  final String email;
  final String password;
  const RegisterPersonalScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterPersonalBodyWidget(
        email: email,
        password: password,
      ),
    );
  }
}
