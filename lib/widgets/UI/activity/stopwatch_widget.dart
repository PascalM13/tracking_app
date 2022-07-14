import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tracking_app/models/acitvity_type/activity_type_model.dart';
import 'package:tracking_app/models/user/user_model.dart';
import 'package:tracking_app/models/wrapper/duration_wrapper.dart';
import 'package:tracking_app/theme/colors.dart';

import '../round_button_icon_widget.dart';

///widget to show, to start and to stop the stopwatch
// ignore: must_be_immutable
class StopWatchWidget extends StatefulWidget {
  DurationWrapper stopWatchTime;
  Function setSaveActivityIsDisabled;
  Function setPedometerIsDisabled;
  ActivityTypeModel activityType;

  StopWatchWidget(
      {Key? key,
      required this.stopWatchTime,
      required this.setSaveActivityIsDisabled,
      required this.setPedometerIsDisabled,
      required this.activityType})
      : super(key: key);

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  bool isStartButtonVisible = true;
  double userWeight = 70.00;

  //Variables for Start and Stop Button
  bool startIsDisabled = false;
  bool stopIsDisabled = true;

  Color startColor = accentColor;
  Color stopColor = secondery;

  setStateStartButton() {
    setState(() {
      startIsDisabled = !startIsDisabled;
      stopIsDisabled = !stopIsDisabled;
    });
    widget.setSaveActivityIsDisabled(true);
  }

  setStateStopButton() {
    setState(() {
      stopIsDisabled = !stopIsDisabled;
      startIsDisabled = !startIsDisabled;
      widget.setSaveActivityIsDisabled(false);
    });
  }

  _setUserWeight() async {
    var user = await UserModel().getCurrentUser();
    userWeight = user.weight != null ? user.weight!.toDouble() : userWeight;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setUserWeight();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snapshot) {
                final value = snapshot.data;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value!, hours: _isHours);
                widget.stopWatchTime.duration = displayTime;
                final kcal = widget.activityType
                    .calcCalsFromStopwatch(displayTime, userWeight);
                return Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Kcals ",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          const WidgetSpan(
                            child: Icon(
                              IconData(0xf86b, fontFamily: 'MaterialIcons'),
                              size: 22,
                              color: accentColor,
                            ),
                          ),
                          TextSpan(
                            text: ": $kcal",
                            style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      displayTime,
                      style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                );
              }),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundButtonIconWidget(
                isDisabled: startIsDisabled,
                iconData: Icons.play_arrow,
                onPress: () {
                  if (startIsDisabled == false) {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    setStateStartButton();
                    widget.setPedometerIsDisabled(true);
                  }
                },
              ),
              RoundButtonIconWidget(
                isDisabled: stopIsDisabled,
                iconData: Icons.pause,
                onPress: () {
                  if (stopIsDisabled == false) {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                    setStateStopButton();
                    widget.setPedometerIsDisabled(false);
                  }
                },
              )
            ],
          ),
        ]);
  }
}
