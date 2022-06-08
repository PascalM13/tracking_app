import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color;
  final Color textColor;

  const RoundedButtonWidget(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
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
