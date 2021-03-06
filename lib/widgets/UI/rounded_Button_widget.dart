import 'package:flutter/material.dart';

/// Widget-Class for Wrapping a Rounded Button, to have an uniformly disigned button
class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color;
  final Color textColor;
  final double buttonWidth;

  const RoundedButtonWidget(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.color,
      required this.textColor,
      this.buttonWidth = 0.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * buttonWidth,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
