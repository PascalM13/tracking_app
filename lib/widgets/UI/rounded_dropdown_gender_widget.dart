import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

class RoundedDropdownGenderWidget extends StatefulWidget {
  final Function setGender;
  const RoundedDropdownGenderWidget({Key? key, required this.setGender})
      : super(key: key);

  @override
  State<RoundedDropdownGenderWidget> createState() =>
      _RoundedDropdownGenderWidgetState();
}

class _RoundedDropdownGenderWidgetState
    extends State<RoundedDropdownGenderWidget> {
  String dropDownValue = "Keine Angabe";

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
            hint: const Text("Geschlecht"),
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
              widget.setGender(dropDownValue);
            },
            items: <String>['Keine Angabe', 'Männlich', 'Weiblich', 'Divers']
                .map<DropdownMenuItem<String>>((String value) {
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
