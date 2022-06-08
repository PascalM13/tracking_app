import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/auth/welcome_background_widget.dart';

import '../UI/rounded_Button_widget.dart';

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
              onPress: () {},
              color: accentColor,
              textColor: primary,
            ),
            RoundedButtonWidget(
              text: "Sign Up",
              onPress: () {},
              color: secondery,
              textColor: Colors.black54,
            )
          ]),
    );
  }
}
