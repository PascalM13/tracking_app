import 'package:flutter/material.dart';
import 'package:tracking_app/models/acitvity_type/activity_type_model.dart';
import 'package:tracking_app/widgets/UI/activity/activity_save_body_widget.dart';

class ActivitySaveScreen extends StatefulWidget {
  int? steps;
  final String duration;
  final DateTime start;
  final DateTime end;
  final ActivityTypeModel activityTypeModel;

  ActivitySaveScreen(
      {Key? key,
      required this.duration,
      required this.start,
      required this.end,
      this.steps,
      required this.activityTypeModel})
      : super(key: key);

  @override
  State<ActivitySaveScreen> createState() => _ActivitySaveScreenState();
}

class _ActivitySaveScreenState extends State<ActivitySaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActivitySaveBodyWidget(
          activityTypeModel: widget.activityTypeModel,
          duration: widget.duration,
          start: widget.start,
          end: widget.end,
          steps: widget.steps),
    );
  }
}
