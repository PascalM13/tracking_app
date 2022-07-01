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
  final double _drawnProgress =
      0.8; //TODO: hier Fortschritt der Tage aus Datenbank eingeben
  final String _progress =
      '8 of 10 days'; //TODO: hier die jeweilige Zahl aus der Datenbank einfügen
  final String _target =
      '10'; //TODO: hier die jeweilige Endzeit aus der Studie einfügen
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: LinearPercentIndicator(
        lineHeight: 25,
        width: size.width - 60,
        barRadius: const Radius.circular(20),
        percent: _drawnProgress,
        animation: true,
        animationDuration: 1000,
        progressColor: accentColor,
        leading: const Text(
          '0',
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
        center: Text(
          _progress,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
        trailing: Text(
          _target,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
