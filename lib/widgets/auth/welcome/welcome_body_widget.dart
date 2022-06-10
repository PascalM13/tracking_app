import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/screens/auth/register_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/auth/welcome/welcome_background_widget.dart';

import '../../UI/rounded_button_widget.dart';

class WelcomeBodyWidget extends StatelessWidget {
  const WelcomeBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Retrive the Size of our device
    Size size = MediaQuery.of(context).size;
    return WelcomeBackgroundWidget(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Welcome to SmartTracker",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20)),
            SvgPicture.asset(
              'assets/images/svg_welcome_screen.svg',
              height: size.height * 0.4,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButtonWidget(
              text: "Login",
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              color: accentColor,
              textColor: primary,
            ),
            RoundedButtonWidget(
              text: "Sign Up",
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
              color: secondery,
              textColor: Colors.black54,
            )
          ]),
    );
  }
}
