import 'package:flutter/material.dart';
import 'package:tracking_app/routes.dart';
import 'package:tracking_app/screens/auth/welcome_screen.dart';
import 'package:tracking_app/theme/colors.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: primary),
    debugShowCheckedModeBanner: false,
    home: const WelcomeScreen(),
    onGenerateRoute: RouterManager.generateRoute,
  ));
}
