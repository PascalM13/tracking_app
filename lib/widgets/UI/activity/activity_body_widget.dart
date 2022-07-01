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
  final _nameController = TextEditingController();

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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _nameController.dispose();
    super.dispose();
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
          if (isChooseButtonVisible == true)
            Column(
              children: [
                RoundedDropdownActivityWidget(
                  setActivity: _setActivity,
                ),
                if (activity == 'Others')
                  Column(
                    children: [
                      InputFieldWidget(
                        hintText: "Name of the activity",
                        icon: Icons.abc_rounded,
                        inputController: _nameController,
                        keyboardtType: TextInputType.text,
                      ),
                    ],
                  ),
                RoundedButtonWidget(
                    text: 'Choose activity',
                    onPress: () {
                      print(activity);
                      if (activity != null) {
                        if (activity == 'Others') {
                          if (_nameController.text != '') {
                            //hier Zeitmessung starten
                            _setVisibilityButton();
                            _setVisibilityStopwatch();
                            print(_nameController.text);
                          } else {
                            print('else-fall');
                          }
                        } else {
                          //hier Zeitmessung starten
                          _setVisibilityButton();
                          _setVisibilityStopwatch();
                        }
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
                      //StopWatchWidget(),
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
