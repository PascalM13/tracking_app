import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tracking_app/theme/colors.dart';

class PercentIndicatorActivityWidget extends StatefulWidget {
  const PercentIndicatorActivityWidget({Key? key}) : super(key: key);

  @override
  State<PercentIndicatorActivityWidget> createState() =>
      _PercentIndicatorActivityWidgetState();
}

class _PercentIndicatorActivityWidgetState
    extends State<PercentIndicatorActivityWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: LinearPercentIndicator(
        lineHeight: 25,
        width: size.width - 60,
        percent:
            56 / 100, //TODO: hier Fortschritt der Tage aus Datenbank eingeben
        animation: true,
        animationDuration: 1000,
        progressColor: accentColor,
        leading: new Text(
          '0',
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
        center: new Text(
          '56 of 100 activities', //TODO: hier die jeweilige Zahl aus der Datenbank einfügen
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
        trailing: new Text(
          '100', //TODO: hier die jeweilige Anzahl an Aktivitäten aus der Studie einfügen
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
