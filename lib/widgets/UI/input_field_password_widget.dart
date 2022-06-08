import 'package:flutter/material.dart';

import 'input_field_widget_container.dart';

class InputFieldPasswordWidget extends StatelessWidget {
  const InputFieldPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InputFieldWidgetContainer(
        child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
          ),
          suffixIcon: Icon(Icons.visibility),
          hintText: "Password",
          border: InputBorder.none),
      keyboardType: TextInputType.visiblePassword,
    ));
  }
}
