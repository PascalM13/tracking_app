import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

class RoundedDropdownActivityWidget extends StatefulWidget {
  final Function setActivity;
  const RoundedDropdownActivityWidget({Key? key, required this.setActivity})
      : super(key: key);

  @override
  State<RoundedDropdownActivityWidget> createState() =>
      _RoundedDropdownActivityWidgetState();
}

class _RoundedDropdownActivityWidgetState
    extends State<RoundedDropdownActivityWidget> {
  String dropDownValue = "Please select";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          color: secondery,
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: const Text("Activity"),
            value: dropDownValue,
            elevation: 16,
            borderRadius: BorderRadius.circular(12.0),
            dropdownColor: secondery,
            style: const TextStyle(color: Colors.black54),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
              widget.setActivity(dropDownValue);
            },
            items: <String>[
              'Please select',
              'Running',
              'Swimming',
              'Cycling',
              'Hiking',
              'Others'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
