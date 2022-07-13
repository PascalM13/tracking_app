import 'package:flutter/material.dart';
import 'package:tracking_app/services/acitivity_type_service.dart';
import 'package:tracking_app/theme/colors.dart';

import '../../../models/acitvity_type/activity_type_model.dart';
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
  ActivityTypeModel? _activity;
  ActivityTypeModel? transferActivity;
  final Future<List<ActivityTypeModel>> _activityList =
      const ActivityTypeService().getActivityTypes();

  // Function to pass to set the state of activity
  void _setActivity(ActivityTypeModel dropDownValue) {
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
        children: [
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
            height: 30,
          ),
          FutureBuilder(
            future:
                _activityList, // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  Column(
                    children: [
                      RoundedDropdownActivityWidget(
                        setActivity: _setActivity,
                        activityList: snapshot.data,
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
                                activity: transferActivity!,
                              );
                            }));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                  "Error - Please select an activity"),
                              backgroundColor: accentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        },
                      ),
                    ],
                  )
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                        'Error: Failed to load Activities - Token Expired, please relog'),
                  )
                ];
              } else {
                children = const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
