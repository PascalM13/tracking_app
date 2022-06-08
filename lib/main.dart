import 'package:flutter/material.dart';
import 'package:tracking_app/routes.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavScreen(),
    onGenerateRoute: RouterManager.generateRoute,
  ));
}
