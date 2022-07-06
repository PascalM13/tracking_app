import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/activity/activity_save_body_widget.dart';

class ActivitySaveScreen extends StatefulWidget {
  const ActivitySaveScreen({Key? key}) : super(key: key);

  @override
  State<ActivitySaveScreen> createState() => _ActivitySaveScreenState();
}

class _ActivitySaveScreenState extends State<ActivitySaveScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ActivitySaveBodyWidget(),
    );
  }
}
