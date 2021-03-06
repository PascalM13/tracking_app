import 'package:flutter/material.dart';
import 'package:tracking_app/models/wrapper/duration_wrapper.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/screens/activity_save_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/activity/pedometer_widget.dart';
import 'package:tracking_app/widgets/UI/activity/stopwatch_widget.dart';
import 'package:tracking_app/widgets/UI/activity_svg_widget.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

import '../../../models/acitvity_type/activity_type_model.dart';

///widget for starting and stopping the activity
class ActivityStartStopWidget extends StatefulWidget {
  final ActivityTypeModel activity;

  const ActivityStartStopWidget({Key? key, required this.activity})
      : super(key: key);
  @override
  State<ActivityStartStopWidget> createState() =>
      _ActivityStartStopWidgetState();
}

class _ActivityStartStopWidgetState extends State<ActivityStartStopWidget> {
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  DurationWrapper stopWatchTime = DurationWrapper("00:00:00:00");
  double kcals = 0.00;

  //Disable Save Activity Button
  bool saveActivityIsDisabled = true;

  //Pedometer steps
  int steps = -1;
  bool pedometerDisabled = true;

  calcSteps() {
    setState(() {
      steps++;
    });
  }

  setPedometerIsDisabled(bool value) {
    setState(() {
      pedometerDisabled = value;
    });
  }

  getPedometerIsDisabled() {
    return pedometerDisabled;
  }

  setSaveActivityIsDisabled(bool value) {
    setState(() {
      saveActivityIsDisabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.activity.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 28.0),
          ),
          const SizedBox(
            height: 30,
          ),
          ActivitySVGWidget(activityName: widget.activity.name),
          PedometerWidget(
            getPedometerIsDisabled: getPedometerIsDisabled,
            calcSteps: calcSteps,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            steps != -1 ? 'My steps: $steps' : 'My steps: 0',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 22.0),
          ),
          StopWatchWidget(
            setPedometerIsDisabled: setPedometerIsDisabled,
            stopWatchTime: stopWatchTime,
            setSaveActivityIsDisabled: setSaveActivityIsDisabled,
            activityType: widget.activity,
          ),
          const SizedBox(
            height: 100,
          ),
          RoundedButtonWidget(
              text: 'Save activity',
              onPress: () {
                if (saveActivityIsDisabled == false) {
                  end = DateTime.now();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ActivitySaveScreen(
                      activityTypeModel: widget.activity,
                      duration: stopWatchTime.duration,
                      steps: steps,
                      start: start,
                      end: end,
                    );
                  }));
                }
              },
              color: saveActivityIsDisabled ? secondery : accentColor,
              textColor: Colors.white),
          RoundedButtonWidget(
              text: 'Cancel',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NavScreen();
                }));
              },
              color: accentColor,
              textColor: Colors.white),
        ],
      ),
    ));
  }
}
