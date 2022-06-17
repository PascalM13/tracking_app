import 'package:flutter/material.dart';

import 'input_field_widget_container.dart';

// ignore: must_be_immutable
class InputFieldWidget extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController inputController;
  final TextInputType keyboardtType;
  final bool isPassword;

  const InputFieldWidget(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.inputController,
      required this.keyboardtType,
      this.isPassword = false})
      : super(key: key);

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return InputFieldWidgetContainer(
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
