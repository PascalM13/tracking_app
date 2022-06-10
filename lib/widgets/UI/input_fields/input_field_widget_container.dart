import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class InputFieldWidgetContainer extends StatelessWidget {
  final Widget child;
  const InputFieldWidgetContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: secondery,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
