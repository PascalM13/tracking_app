import 'package:flutter/material.dart';
import 'package:tracking_app/models/activity/activity_model.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';

import '../activity_svg_widget.dart';

class HistoryCardInfoWidget extends StatefulWidget {
  final ActivityModel activityModel;
  const HistoryCardInfoWidget({Key? key, required this.activityModel})
      : super(key: key);

  @override
  State<HistoryCardInfoWidget> createState() => _HistoryCardInfoWidgetState();
}

class _HistoryCardInfoWidgetState extends State<HistoryCardInfoWidget> {
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
          Text(
            widget.activityModel.getDateString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 20.0),
          ),
          const SizedBox(
            height: 20,
          ),
          ActivitySVGWidget(activityName: widget.activityModel.activityName!),
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
                                'Start time:\n${widget.activityModel.getStartTimeString()} h',
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
                                'Heartrate:\n${widget.activityModel.hearthrate} BPM',
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
                                'Distance:\n${widget.activityModel.distance} m',
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
                                'End time:\n${widget.activityModel.getEndTimeString()} h',
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
                                'Blood sugar\n${widget.activityModel.bloodSugarOxygen} mg/dl',
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
