import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

class StopWatchWidget extends StatefulWidget {
  String stopWatchTime;
  StopWatchWidget({Key? key, required this.stopWatchTime}) : super(key: key);

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  bool isStartButtonVisible = true;

  //Function to set the visibility
  void _setVisibilityOfButton() {
    setState(() {
      isStartButtonVisible = !isStartButtonVisible;
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
                widget.stopWatchTime = displayTime;
                return Text(
                  displayTime,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
          const SizedBox(
            height: 15,
          ),
          if (isStartButtonVisible == true)
            Column(
              children: [
                RoundedButtonWidget(
                    text: 'Start Activity',
                    onPress: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                      _setVisibilityOfButton();
                    },
                    color: accentColor,
                    textColor: Colors.white),
              ],
            ),
          if (isStartButtonVisible == false)
            Column(
              children: [
                RoundedButtonWidget(
                    text: 'Stop Activity',
                    onPress: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                      _setVisibilityOfButton();
                      //mit showTime kann die gestoppte Zeit an die Datenbank übermittelt werden
                      print(widget.stopWatchTime);
                    },
                    color: accentColor,
                    textColor: Colors.white),
              ],
            ),
        ]);
  }
}
