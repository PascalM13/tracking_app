import 'package:flutter/material.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/screens/auth/welcome_screen.dart';
import 'package:tracking_app/screens/history_screen.dart';
import 'package:tracking_app/screens/home_screen.dart';
import 'package:tracking_app/screens/profile_screen.dart';

class RouterManager {
  static const String homeScreen = '/';
  static const String activityScreen = '/acitivity';
  static const String historyScreen = '/history';
  static const String profileScreen = '/profile';

  static const String welcomeScreen = '/welcome';
  static const String loginScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case activityScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case historyScreen:
        return MaterialPageRoute(
          builder: (context) => const HistoryScreen(),
        );

      case profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      default:
        throw const FormatException('Route not found! Check routes again');
    }
  }
}
