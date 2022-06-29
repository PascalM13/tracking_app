import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/home/home_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBodyWidget(),
    );
  }
}
