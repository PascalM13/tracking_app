import 'package:flutter/material.dart';

import '../../widgets/auth/register/register_body_widget.dart';

///Screen for the registration, where the widget is opened
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterBodyWidget(),
    );
  }
}
