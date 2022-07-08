import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tracking_app/models/wrapper/duration_wrapper.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

import '../round_button_icon_widget.dart';

class StopWatchWidget extends StatefulWidget {
  DurationWrapper stopWatchTime;
  Function setSaveActivityIsDisabled;
  StopWatchWidget(
      {Key? key,
      required this.stopWatchTime,
      required this.setSaveActivityIsDisabled})
      : super(key: key);

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  bool isStartButtonVisible = true;

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
                return Text(
                  displayTime,
                  style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
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
                  }
                },
              )
            ],
          ),
        ]);
  }
}
