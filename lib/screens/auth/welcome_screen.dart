import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/auth/welcome/welcome_body_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBodyWidget(),
    );
  }
}
