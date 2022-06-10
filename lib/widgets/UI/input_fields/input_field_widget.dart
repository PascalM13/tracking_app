import 'package:flutter/material.dart';

import 'input_field_widget_container.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const InputFieldWidget({Key? key, required this.hintText, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputFieldWidgetContainer(
        child: TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
          ),
          hintText: hintText,
          border: InputBorder.none),
    ));
  }
}
