import 'package:flutter/material.dart';

///widget for setting the background in registration
class RegisterBackgroundWidget extends StatelessWidget {
  final Widget child;
  const RegisterBackgroundWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/top_welcome_screen.png',
              width: size.width * 0.6,
            ),
          ),
          child
        ],
      ),
    );
  }
}
