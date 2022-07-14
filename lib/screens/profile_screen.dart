import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/profile/profile_body_widget.dart';

///Screen for the profile, where the widget is opened
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBodyWidget(),
    );
  }
}
