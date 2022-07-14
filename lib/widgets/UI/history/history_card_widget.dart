import 'package:flutter/material.dart';
import 'package:tracking_app/models/activity/activity_model.dart';
import 'package:tracking_app/screens/history_card_screen.dart';

///widget for creating a card which is shown in the history
class HistoryCardWidget extends StatefulWidget {
  final ActivityModel activityModel;
  const HistoryCardWidget({Key? key, required this.activityModel})
      : super(key: key);

  @override
  State<HistoryCardWidget> createState() => _HistoryCardWidgetState();
}

class _HistoryCardWidgetState extends State<HistoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HistoryCardScreen(
              activityModel: widget.activityModel,
            );
          }));
        },
        child: SizedBox(
          width: 300,
          height: 60,
          child: Center(
              child: Text(
            '${widget.activityModel.getDateString()}     ${widget.activityModel.activityName!}',
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
