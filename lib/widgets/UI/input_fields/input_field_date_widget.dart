import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget_container.dart';

class InputFieldDateWidget extends StatefulWidget {
  final TextEditingController inputController;
  final double inputWidth;

  const InputFieldDateWidget(
      {Key? key, required this.inputController, this.inputWidth = 0.8})
      : super(key: key);

  @override
  State<InputFieldDateWidget> createState() => _InputFieldDateWidgetState();
}

class _InputFieldDateWidgetState extends State<InputFieldDateWidget> {
  @override
  Widget build(BuildContext context) {
    return InputFieldWidgetContainer(
        inputWidth: widget.inputWidth,
        child: TextField(
          controller: widget.inputController,
          readOnly: true,
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.calendar_month,
              ),
              hintText: "13/06/1999",
              border: InputBorder.none),
          onTap: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000, 1, 1),
                firstDate: DateTime(1900),
                lastDate: DateTime(2022));

            // if 'cancel' => null
            if (newDate == null) return;

            String selectedDate =
                '${newDate.day}/${newDate.month}/${newDate.year}';
            setState(() => widget.inputController.text = selectedDate);
          },
        ));
  }
}
