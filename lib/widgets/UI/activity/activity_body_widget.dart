import 'package:flutter/material.dart';
import 'package:tracking_app/screens/activity_startstop_screen.dart';
import 'package:tracking_app/theme/colors.dart';
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
  String? _activity;
  String transferActivity = '';
  final _nameController = TextEditingController();

  // Function to pass to set the state of activity
  void _setActivity(String dropDownValue) {
    setState(() {
      _activity = dropDownValue;
      transferActivity = _activity!;
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
              if (_activity == 'Others')
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
                    print(_activity);
                    if (_activity != null) {
                      if (_activity == 'Others') {
                        if (_nameController.text != '') {
                          //hier Zeitmessung starten

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ActivityStartStopScreen(
                              activity: transferActivity,
                              writtenActivity: _nameController.text,
                            );
                          }));
                          print(_nameController.text);
                        } else {
                          print('else-fall');
                        }
                      } else {
                        //hier Zeitmessung starten

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ActivityStartStopScreen(
                            activity: transferActivity,
                            writtenActivity: _nameController.text,
                          );
                        }));
                      }
                    }
                  },
                  color: accentColor,
                  textColor: Colors.white),
            ],
          ),
        ],
      ),
    ));
  }
}
