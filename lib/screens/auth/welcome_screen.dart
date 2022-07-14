import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/auth/welcome/welcome_body_widget.dart';

///Screen for welcome the user before login or registration, where the widget is opened
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBodyWidget(),
    );
  }
}
