import 'package:flutter/material.dart';
import 'package:tracking_app/models/activity/activity_model.dart';
import 'package:tracking_app/widgets/UI/history/history_card_info_widget.dart';

///Screen for the history cards, where the widget is opened
class HistoryCardScreen extends StatelessWidget {
  final ActivityModel activityModel;

  const HistoryCardScreen({
    Key? key,
    required this.activityModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HistoryCardInfoWidget(activityModel: activityModel),
    );
  }
}
