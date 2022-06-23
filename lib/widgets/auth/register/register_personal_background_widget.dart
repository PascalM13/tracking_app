import 'package:flutter/material.dart';

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
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom_welcome_screen.png',
              width: size.width * 0.6,
            ),
          ),
          child
        ],
      ),
    );
  }
}
