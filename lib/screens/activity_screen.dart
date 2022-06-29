import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/activity/activity_body_widget.dart';

class AcitvityScreen extends StatelessWidget {
  const AcitvityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ActivityBodyWidget(),
    );
  }
}
