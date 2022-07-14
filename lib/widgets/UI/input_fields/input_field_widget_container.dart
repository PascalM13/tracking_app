import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

//Widget-Container for uniformly styling of Input Fields
class InputFieldWidgetContainer extends StatelessWidget {
  final double inputWidth;
  final Widget child;
  const InputFieldWidgetContainer(
      {Key? key, required this.child, required this.inputWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      width: size.width * inputWidth,
      decoration: BoxDecoration(
        color: secondery,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
