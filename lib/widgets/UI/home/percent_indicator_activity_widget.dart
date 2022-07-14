import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tracking_app/theme/colors.dart';

///progress bar for counting activities
class PercentIndicatorActivityWidget extends StatefulWidget {
  const PercentIndicatorActivityWidget({Key? key}) : super(key: key);

  @override
  State<PercentIndicatorActivityWidget> createState() =>
      _PercentIndicatorActivityWidgetState();
}

class _PercentIndicatorActivityWidgetState
    extends State<PercentIndicatorActivityWidget> {
  final double _drawnProgress = 0.56;
  final String _progress = '56 of 100 activities';
  final String _target = '100';
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
