import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/activity/activity_startstop_widget.dart';

class ActivityStartStopScreen extends StatelessWidget {
  final String activity;
  final String writtenActivity;
  const ActivityStartStopScreen(
      {Key? key, required this.activity, required this.writtenActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActivityStartStopWidget(
        activity: activity,
        writtenActivity: writtenActivity,
      ),
    );
  }
}
