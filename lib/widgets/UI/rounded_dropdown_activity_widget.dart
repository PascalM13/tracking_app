import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

import '../../models/acitvity_type/activity_type_model.dart';

/// Widget-Class for Displaying a Rounded Dropdown Button, to select a Activity
class RoundedDropdownActivityWidget extends StatefulWidget {
  final Function setActivity;
  final List<ActivityTypeModel> activityList;
  const RoundedDropdownActivityWidget(
      {Key? key, required this.setActivity, required this.activityList})
      : super(key: key);

  @override
  State<RoundedDropdownActivityWidget> createState() =>
      _RoundedDropdownActivityWidgetState();
}

class _RoundedDropdownActivityWidgetState
    extends State<RoundedDropdownActivityWidget> {
  ActivityTypeModel? dropDownValue;

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
          child: DropdownButton<ActivityTypeModel>(
            hint: const Text("Your Activity"),
            value: dropDownValue,
            elevation: 16,
            borderRadius: BorderRadius.circular(12.0),
            dropdownColor: secondery,
            style: const TextStyle(color: Colors.black54),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (ActivityTypeModel? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
              widget.setActivity(dropDownValue);
            },
            items: widget.activityList.map<DropdownMenuItem<ActivityTypeModel>>(
                (ActivityTypeModel value) {
              return DropdownMenuItem<ActivityTypeModel>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
