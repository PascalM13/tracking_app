import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/activity/stopwatch_widget.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_dropdown_activity_widget.dart';

class ActivityBodyWidget extends StatefulWidget {
  const ActivityBodyWidget({Key? key}) : super(key: key);

  @override
  State<ActivityBodyWidget> createState() => _ActivityBodyWidgetState();
}

class _ActivityBodyWidgetState extends State<ActivityBodyWidget> {
  String? activity;
  bool isChooseButtonVisible = true;
  bool isStopwatchVisible = false;

  // Function to pass to set the state of activity
  void _setActivity(String dropDownValue) {
    setState(() {
      activity = dropDownValue;
    });
  }

  //Function to set the visibility
  void _setVisibilityButton() {
    setState(() {
      isChooseButtonVisible = !isChooseButtonVisible;
    });
  }

  //Function to set the visibility
  void _setVisibilityStopwatch() {
    setState(() {
      isStopwatchVisible = !isStopwatchVisible;
    });
  }

  void test() {
    _setVisibilityStopwatch();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/login_screen.jpg',
            height: size.height * 0.3,
          ),
          const SizedBox(
            height: 15,
          ),
          if (isChooseButtonVisible == true)
            Column(
              children: [
                RoundedDropdownActivityWidget(
                  setActivity: _setActivity,
                ),
                if (activity == 'Others')
                  Column(
                    children: [
                      const InputFieldWidget(
                        hintText: "Name of the activity",
                        icon: Icons.abc_rounded,
                      ),
                    ],
                  ),
                RoundedButtonWidget(
                    text: 'Choose activity',
                    onPress: () {
                      print(activity);
                      if (activity != null) {
                        //hier Zeitmessung starten
                        _setVisibilityButton();
                        _setVisibilityStopwatch();
                      }
                    },
                    color: accentColor,
                    textColor: Colors.white),
              ],
            ),
          if (isChooseButtonVisible == false)
            Column(
              children: [
                if (isStopwatchVisible == true)
                  Column(
                    children: [
                      StopWatchWidget(),
                      const SizedBox(
                        height: 15,
                      ),
                      RoundedButtonWidget(
                          text: 'Save activity',
                          onPress: () {
                            //hier Übertragung in Datenbank
                            _setVisibilityButton();
                            _setVisibilityStopwatch();
                            activity = null;
                          },
                          color: accentColor,
                          textColor: Colors.white),
                    ],
                  ),
              ],
            ),
        ],
      ),
    ));
  }
}
