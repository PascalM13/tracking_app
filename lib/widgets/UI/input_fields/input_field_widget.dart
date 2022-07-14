import 'package:flutter/material.dart';

import 'input_field_widget_container.dart';

/// Widget-class to create a default input field
class InputFieldWidget extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController inputController;
  final TextInputType keyboardtType;
  final bool isPassword;
  final double inputWidth;

  const InputFieldWidget(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.inputController,
      required this.keyboardtType,
      this.isPassword = false,
      this.inputWidth = 0.8})
      : super(key: key);

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return InputFieldWidgetContainer(
        inputWidth: widget.inputWidth,
        child: TextField(
          controller: widget.inputController,
          obscureText: widget.isPassword, // Hide if Widget is used for password
          decoration: InputDecoration(
              prefixIcon: Icon(
                widget.icon,
              ),
              hintText: widget.hintText,
              border: InputBorder.none),
          keyboardType: widget.keyboardtType,
        ));
  }
}
