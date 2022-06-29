import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tracking_app/theme/colors.dart';

class PercentIndicatorDayWidget extends StatefulWidget {
  const PercentIndicatorDayWidget({Key? key}) : super(key: key);

  @override
  State<PercentIndicatorDayWidget> createState() =>
      _PercentIndicatorDayWidgetState();
}

class _PercentIndicatorDayWidgetState extends State<PercentIndicatorDayWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: LinearPercentIndicator(
        lineHeight: 25,
        width: size.width - 60,
        percent:
            80 / 100, //TODO: hier Fortschritt der Tage aus Datenbank eingeben
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
          '8 of 10 days', //TODO: hier die jeweilige Zahl aus der Datenbank einfügen
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
        trailing: new Text(
          '10', //TODO: hier die jeweilige Endzeit aus der Studie einfügen
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
