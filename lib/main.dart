import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/routes.dart';
import 'package:tracking_app/theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Look if User is already set in Flutter Secure Storage to get ID, Name etc. of User
  const storage = FlutterSecureStorage();
  // Look if User is already logged in, if not token will be empty
  String? token = await storage.read(key: 'access_token');

  //Default Route is different if user is already logged in, if not, user will be send to welcome screen
  String defaultRoute =
      (token == null) ? RouterManager.welcomeScreen : RouterManager.navScreen;

  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: accentColor)),
    debugShowCheckedModeBanner: false,
    onGenerateRoute: RouterManager.generateRoute,
    initialRoute: defaultRoute,
  ));
}
