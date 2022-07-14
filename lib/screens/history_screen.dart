import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/history/history_body_widget.dart';

///Screen for the history, where the widget is opened
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HistoryBodyWidget(),
    );
  }
}
