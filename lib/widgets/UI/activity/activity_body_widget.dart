import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

import '../../../screens/activity_startstop_screen.dart';
import '../background/screen_background_widget.dart';
import '../rounded_button_widget.dart';
import '../rounded_dropdown_activity_widget.dart';

class ActivityBodyWidget extends StatefulWidget {
  const ActivityBodyWidget({Key? key}) : super(key: key);

  @override
  State<ActivityBodyWidget> createState() => _ActivityBodyWidgetState();
}

class _ActivityBodyWidgetState extends State<ActivityBodyWidget> {
  String? _activity;
  String transferActivity = '';

  // Function to pass to set the state of activity
  void _setActivity(String dropDownValue) {
    setState(() {
      _activity = dropDownValue;
      transferActivity = _activity!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Activity",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          Image.asset(
            'assets/images/login_screen.jpg',
            height: size.height * 0.3,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: size.width - 60,
            child: const Text(
              "Please select the activity you would like to do now. If your activity isn't in the list yet, select 'Others' and try to name it appropriately.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              RoundedDropdownActivityWidget(
                setActivity: _setActivity,
              ),
              RoundedButtonWidget(
                text: 'Choose activity',
                color: accentColor,
                textColor: Colors.white,
                onPress: () {
                  if (_activity != null) {
                    //hier Zeitmessung starten

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ActivityStartStopScreen(
                        activity: transferActivity,
                      );
                    }));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Error - Please select an activity"),
                      backgroundColor: accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
