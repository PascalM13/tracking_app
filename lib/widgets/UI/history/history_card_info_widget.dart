import 'package:flutter/material.dart';
import 'package:tracking_app/models/activity/activity_model.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';

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
        children: [
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
            padding: const EdgeInsets.all(20), //40
            child: Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: accentColor,
                        width: (size.width / 2) - 30, //50
                        height: 100,
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
                                width: 8,
                              ),
                              Text(
                                'Start date:\n${widget.activityModel.startDate}',
                                overflow: TextOverflow.visible,
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
                        width: (size.width / 2) - 30,
                        height: 100,
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
                                width: 8,
                              ),
                              Text(
                                'Heartrate:\n${widget.activityModel.hearthrate}',
                                overflow: TextOverflow.visible,
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
                        width: (size.width / 2) - 30,
                        height: 100,
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
                                width: 8,
                              ),
                              Text(
                                'Distance:\n${widget.activityModel.distance}',
                                overflow: TextOverflow.visible,
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
                        width: (size.width / 2) - 30,
                        height: 100,
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
                                width: 8,
                              ),
                              Text(
                                'End date:\n${widget.activityModel.endDate}',
                                overflow: TextOverflow.visible,
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
                        width: (size.width / 2) - 30,
                        height: 100,
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
                                width: 8,
                              ),
                              Text(
                                'Steps:\n${widget.activityModel.steps}',
                                overflow: TextOverflow.visible,
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
                        width: (size.width / 2) - 30,
                        height: 100,
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
                                width: 8,
                              ),
                              Text(
                                'Blood sugar\n${widget.activityModel.bloodSugarOxygen}',
                                overflow: TextOverflow.visible,
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
        ],
      ),
    ));
  }
}
