import 'package:flutter/material.dart';

///widget for setting the background to welcome
class WelcomeBackgroundWidget extends StatelessWidget {
  final Widget child;
  const WelcomeBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top_welcome_screen.png',
                width: size.width * 0.9,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bottom_welcome_screen.png',
                width: size.width * 0.3,
              )),
          child
        ],
      ),
    );
  }
}
