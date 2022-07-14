import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/activity/activity_body_widget.dart';

///Screen for the activites, where the widget is opened
class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ActivityBodyWidget(),
    );
  }
}
