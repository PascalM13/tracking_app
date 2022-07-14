import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_field_widget_container.dart';

/// Widget-class for creating an Input Field with rounded corners and a uniformed style, which allows Numbers Only
class InputFieldNumbersWidget extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController inputController;
  final TextInputType keyboardtType;
  final bool isPassword;
  final double inputWidth;
  final String labelText;

  const InputFieldNumbersWidget({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.inputController,
    required this.keyboardtType,
    required this.labelText,
    this.isPassword = false,
    this.inputWidth = 0.8,
  }) : super(key: key);

  @override
  State<InputFieldNumbersWidget> createState() =>
      _InputFieldNumbersWidgetState();
}

class _InputFieldNumbersWidgetState extends State<InputFieldNumbersWidget> {
  @override
  Widget build(BuildContext context) {
    return InputFieldWidgetContainer(
        inputWidth: widget.inputWidth,
        child: TextField(
          controller: widget.inputController,
          obscureText: widget.isPassword,
          textAlignVertical:
              TextAlignVertical.top, // Hide if Widget is used for password
          decoration: InputDecoration(
              prefixIcon: Icon(
                widget.icon,
              ),
              hintText: widget.hintText,
              border: InputBorder.none,
              labelText: widget.labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always),
          keyboardType: widget.keyboardtType,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ));
  }
}
