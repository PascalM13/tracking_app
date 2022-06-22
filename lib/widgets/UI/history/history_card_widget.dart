import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

class HistoryCardWidget extends StatefulWidget {
  const HistoryCardWidget({Key? key}) : super(key: key);

  @override
  State<HistoryCardWidget> createState() => _HistoryCardWidgetState();
}

class _HistoryCardWidgetState extends State<HistoryCardWidget> {
  String _dateOfActivity = '22-06-2022'; //Datum aus Datenbank übergeben
  String _nameOfActivity = 'Cycling'; //Aktivität aus Datenbank übergeben

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print("ontab"); //hier: wo es hingehen soll
        },
        child: SizedBox(
          width: 300,
          height: 60,
          child: Center(
              child: Text(
            _dateOfActivity + '     ' + _nameOfActivity,
            style: TextStyle(color: accentColor, fontSize: 14.0),
          )),
        ),
      ),
    );
  }
}
