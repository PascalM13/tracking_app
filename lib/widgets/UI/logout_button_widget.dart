import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

import '../../theme/colors.dart';

class LogoutButtonWidget extends StatefulWidget {
  const LogoutButtonWidget({Key? key}) : super(key: key);

  @override
  State<LogoutButtonWidget> createState() => _LogoutButtonWidgetState();
}

class _LogoutButtonWidgetState extends State<LogoutButtonWidget> {
  Future<void> _logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    const storage = FlutterSecureStorage();

    //Clear token and shared preferences
    await preferences.clear();
    await storage.deleteAll();

    //Navigate to Welcome
    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
        context, '/', ModalRoute.withName('/nav'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RoundedButtonWidget(
          text: 'Logout',
          onPress: () => {_logout()},
          color: accentColor,
          textColor: Colors.white),
    );
  }
}
