import 'package:flutter/material.dart';

import 'input_field_widget_container.dart';

class InputFieldEmailWidget extends StatelessWidget {
  const InputFieldEmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InputFieldWidgetContainer(
        child: TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
          ),
          hintText: "Your Email",
          border: InputBorder.none),
      keyboardType: TextInputType.emailAddress,
    ));
  }
}
