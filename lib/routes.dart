import 'package:flutter/material.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/screens/activity_screen.dart';
import 'package:tracking_app/screens/auth/login_forgot_password_screen.dart';
import 'package:tracking_app/screens/auth/login_forgot_password_verify_screen.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/screens/auth/register_personal_screen.dart';
import 'package:tracking_app/screens/auth/register_screen.dart';
import 'package:tracking_app/screens/auth/verify_screen.dart';
import 'package:tracking_app/screens/auth/welcome_screen.dart';
import 'package:tracking_app/screens/history_screen.dart';
import 'package:tracking_app/screens/home_screen.dart';
import 'package:tracking_app/screens/profile_screen.dart';

class RouterManager {
  //Non-Auth Screens
  static const String navScreen = '/nav';
  static const String homeScreen = '/home';
  static const String activityScreen = '/activity';
  static const String historyScreen = '/history';
  static const String profileScreen = '/profile';

  //Auth Screens
  static const String welcomeScreen = '/';
  static const String loginScreen = '/login';
  static const String loginForgotPasswordScreen = '/login-forgot-password';
  static const String loginForgotPasswordVerifyScreen =
      '/login-fogot-password-verify';
  static const String registerScreen = '/register';
  static const String registerPersonalScreen = '/register-personal';
  static const String verifyScreen = '/verify';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case navScreen:
        return MaterialPageRoute(
          builder: (context) => const NavScreen(),
        );

      case welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case activityScreen:
        return MaterialPageRoute(
          builder: (context) => const ActivityScreen(),
        );

      case historyScreen:
        return MaterialPageRoute(
          builder: (context) => const HistoryScreen(),
        );

      case profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      case verifyScreen:
        return MaterialPageRoute(
          builder: (context) => const VerifyScreen(),
        );

      case loginForgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginForgotPasswordScreen(),
        );

      case loginForgotPasswordVerifyScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginForgotPasswordVerifyScreen(),
        );

      case registerPersonalScreen:
        return MaterialPageRoute(
          builder: (context) =>
              const RegisterPersonalScreen(email: "test", password: "test"),
        );

      default:
        throw const FormatException('Route not found! Check routes again');
    }
  }
}
