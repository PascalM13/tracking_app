import 'package:flutter/material.dart';
import 'package:tracking_app/widgets/UI/history/history_card_info_widget.dart';

class HistoryCardScreen extends StatelessWidget {
  final String dateOfActivity;
  final String nameOfActivity;
  const HistoryCardScreen(
      {Key? key, required this.dateOfActivity, required this.nameOfActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HistoryCardInfoWidget(
          dateOfActivity: dateOfActivity, nameOfActivity: nameOfActivity),
    );
  }
}
