import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tracking_app/theme/colors.dart';

import '../../../models/project/project_model.dart';
import '../../../services/project_service.dart';

class PercentIndicatorDayWidget extends StatefulWidget {
  const PercentIndicatorDayWidget({Key? key}) : super(key: key);

  @override
  State<PercentIndicatorDayWidget> createState() =>
      _PercentIndicatorDayWidgetState();
}

class _PercentIndicatorDayWidgetState extends State<PercentIndicatorDayWidget> {
  double _drawnProgress = 0;
  String _progress = '';

  String _startdate = "";
  //String _enddate = "";

  void _getStudyInformation() async {
    ProjectModel project = await const ProjectService().getProject();

    setState(() {
      _startdate = project.startDate.toString().substring(0, 10);
      //_enddate = project.endDate.toString().substring(0, 10);
      final DateTime currentdateAsNumbers = DateTime.now();
      if (currentdateAsNumbers.compareTo(project.endDate) <= 0) {
        if (project.startDate.compareTo(currentdateAsNumbers) <= 0) {
          var diffStartNow = project.startDate.difference(currentdateAsNumbers);
          var pastDays = (diffStartNow.inDays * (-1) + 1);

          var diffStartEnd = project.startDate.difference(project.endDate);
          var daysOfStudy = (diffStartEnd.inDays * (-1) + 2);
          _progress = "You are on day $pastDays of $daysOfStudy";
          _drawnProgress = (pastDays / daysOfStudy);
        } else {
          _progress = "Study starts on $_startdate";
          _drawnProgress = 0;
        }
      } else {
        _progress = "Study is finished";
        _drawnProgress = 1;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getStudyInformation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: LinearPercentIndicator(
        alignment: MainAxisAlignment.center,
        lineHeight: 25,
        width: size.width - 60,
        barRadius: const Radius.circular(20),
        percent: _drawnProgress,
        animation: true,
        animationDuration: 1000,
        progressColor: accentColor,
        /*leading: Text(
          _startdate,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),*/
        center: Text(
          _progress,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),
        /*trailing: Text(
          _enddate,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11.0,
          ),
        ),*/
      ),
    );
  }
}
