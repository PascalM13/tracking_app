import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/profile/profile_change_widget.dart';

class ProfileChangeScreen extends StatelessWidget {
  const ProfileChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileChangeWidget(),
    );
  }
}
