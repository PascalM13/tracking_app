import 'package:flutter/material.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/screens/activity_save_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/activity/pedometer_widget.dart';
import 'package:tracking_app/widgets/UI/activity/stopwatch_widget.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

import '../../../models/acitvity_type/activity_type_model.dart';

class ActivityStartStopWidget extends StatefulWidget {
  final ActivityTypeModel activity;
  const ActivityStartStopWidget({Key? key, required this.activity})
      : super(key: key);
  @override
  State<ActivityStartStopWidget> createState() =>
      _ActivityStartStopWidgetState();
}

class _ActivityStartStopWidgetState extends State<ActivityStartStopWidget> {
  final String _header = 'Activity';
  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _header,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          const SizedBox(
            height: 30,
          ),
          const PedometerWidget(),
          const SizedBox(
            height: 15,
          ),
          const StopWatchWidget(),
          const SizedBox(
            height: 15,
          ),
          RoundedButtonWidget(
              text: 'Save activity',
              onPress: () {
                //hier Übertragung in Datenbank

                print(widget.activity);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ActivitySaveScreen();
                }));
              },
              color: accentColor,
              textColor: Colors.white),
          const SizedBox(
            height: 15,
          ),
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
