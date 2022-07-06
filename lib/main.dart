import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/routes.dart';
import 'package:tracking_app/theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const storage = FlutterSecureStorage();
  String? token = await storage.read(key: 'access_token');

  String defaultRoute =
      (token == null) ? RouterManager.welcomeScreen : RouterManager.navScreen;

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
