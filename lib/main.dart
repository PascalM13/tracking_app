import 'package:flutter/material.dart';
import 'package:tracking_app/routes.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  String defaultRoute = RouterManager.welcomeScreen;
  RouterManager.startingRoute(defaultRoute);

  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: accentColor)),
    debugShowCheckedModeBanner: false,
    //home: const NavScreen(), //home: const WelcomeScreen(),
    onGenerateRoute: RouterManager.generateRoute,

    initialRoute: defaultRoute,
  ));
}
