import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/activity/activity_startstop_widget.dart';

import '../models/acitvity_type/activity_type_model.dart';

///Screen for starting and stopping the activites, where the widget is opened
class ActivityStartStopScreen extends StatelessWidget {
  final ActivityTypeModel activity;
  const ActivityStartStopScreen({Key? key, required this.activity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActivityStartStopWidget(
        activity: activity,
      ),
    );
  }
}
