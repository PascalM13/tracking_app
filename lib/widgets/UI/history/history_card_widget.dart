import 'package:flutter/material.dart';
import 'package:tracking_app/screens/history_card_screen.dart';
import 'package:tracking_app/theme/colors.dart';

class HistoryCardWidget extends StatefulWidget {
  final dateOfActivity;
  final nameOfActivity;
  const HistoryCardWidget(
      {Key? key, required this.dateOfActivity, required this.nameOfActivity})
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
              dateOfActivity: widget.dateOfActivity,
              nameOfActivity: widget.nameOfActivity,
            );
          }));
        },
        child: SizedBox(
          width: 300,
          height: 60,
          child: Center(
              child: Text(
            widget.dateOfActivity + '     ' + widget.nameOfActivity,
            style: const TextStyle(color: accentColor, fontSize: 14.0),
          )),
        ),
      ),
    );
  }
}
