import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

class StopWatchWidget extends StatefulWidget {
  const StopWatchWidget({Key? key}) : super(key: key);

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  String showTime = '';
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
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snapshot) {
                final value = snapshot.data;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value!, hours: _isHours);
                showTime = displayTime;
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
                    text: 'End Activity',
                    onPress: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                      print(
                          showTime); //mit showTime kann die gestoppte Zeit an die Datenbank übermittelt werden
                    },
                    color: accentColor,
                    textColor: Colors.white),
              ],
            ),
        ]));
  }
}
