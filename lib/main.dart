import 'package:flutter/material.dart';
import 'package:tracking_app/routes.dart';
import 'package:tracking_app/screens/auth/welcome_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: accentColor)),
    debugShowCheckedModeBanner: false,
    home: const WelcomeScreen(),
    onGenerateRoute: RouterManager.generateRoute,
  ));
}
