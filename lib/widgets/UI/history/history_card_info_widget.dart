import 'package:flutter/material.dart';
import 'package:tracking_app/models/activity/activity_model.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

class HistoryCardInfoWidget extends StatefulWidget {
  final ActivityModel activityModel;
  const HistoryCardInfoWidget({Key? key, required this.activityModel})
      : super(key: key);

  @override
  State<HistoryCardInfoWidget> createState() => _HistoryCardInfoWidgetState();
}

class _HistoryCardInfoWidgetState extends State<HistoryCardInfoWidget> {
  final String _startdate = '12:47';
  final String _enddate = '14:20';
  final String _heartrate = '123';
  final String _steps = '1234';
  final String _distance = '9 km'; // in km
  final String _bloodSugarOxygen = '12';
  //final String _activityType = 'One cool activity';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.activityModel.activityName!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(40),
            child: Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: accentColor,
                        width: (size.width / 2) - 50,
                        height: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.sunny,
                                size: 30,
                                color: secondery,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Start date:\n${widget.activityModel.startDate}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: secondery,
                                    fontSize: 17.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: secondery,
                        width: (size.width / 2) - 50,
                        height: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.monitor_heart_outlined,
                                size: 30,
                                color: accentColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Heartrate:\n${widget.activityModel.hearthrate}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: accentColor,
                                    fontSize: 17.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: accentColor,
                        width: (size.width / 2) - 50,
                        height: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.map_outlined,
                                size: 30,
                                color: secondery,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Distance:\n${widget.activityModel.distance}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: secondery,
                                    fontSize: 17.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: secondery,
                        width: (size.width / 2) - 50,
                        height: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.brightness_3_rounded,
                                size: 30,
                                color: accentColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'End date:\n${widget.activityModel.endDate}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: accentColor,
                                    fontSize: 17.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: accentColor,
                        width: (size.width / 2) - 50,
                        height: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.directions_run_rounded,
                                size: 30,
                                color: secondery,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Steps:\n${widget.activityModel.steps}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: secondery,
                                    fontSize: 17.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: secondery,
                        width: (size.width / 2) - 50,
                        height: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.bloodtype_outlined,
                                size: 30,
                                color: accentColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Blood sugar\n${widget.activityModel.bloodSugarOxygen}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: accentColor,
                                    fontSize: 17.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RoundedButtonWidget(
              text: 'Back',
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
