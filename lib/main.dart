import 'package:flutter/material.dart';
import 'package:tracking_app/routes.dart';
import 'package:tracking_app/theme/colors.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: accentColor)),
    debugShowCheckedModeBanner: false,

    //Code that is setting the routing and the default first page
    onGenerateRoute: RouterManager.generateRoute,
    initialRoute: RouterManager.welcomeScreen,
  ));
}
