import 'package:flutter/material.dart';
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
            Image.asset(
              'assets/images/welcome_screen.png',
              height: size.height * 0.3,
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
            ),
            /*RoundedButtonWidget(
              text: "Test",
              onPress: () async {
                SignInDto dto = SignInDto("pascal@example.com", "password");
                int res = await AuthService().signIn(dto);
                if (res == 201) {
                  ActivityDto dto = ActivityDto(
                    startDate: 1740991600000,
                    endDate: 1760991600000,
                    userId: 18,
                    activityTypeId: 1,
                    projectId: 1,
                    steps: 2000,
                  );
                  await ActivityService().createActivity(dto);
                }
              },
              color: secondery,
              textColor: Colors.black54,
            )*/
          ]),
    );
  }
}
