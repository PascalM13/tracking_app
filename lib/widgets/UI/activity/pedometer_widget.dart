import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tracking_app/theme/colors.dart';

class PedometerWidget extends StatefulWidget {
  Function getSteps;
  Function calcSteps;
  PedometerWidget({Key? key, required this.getSteps, required this.calcSteps})
      : super(key: key);

  @override
  State<PedometerWidget> createState() => _PedometerWidgetState();
}

class _PedometerWidgetState extends State<PedometerWidget> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    setState(() {
      widget.calcSteps();
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  Future<Permission> getMotionPermission() async {
    if (Platform.isAndroid && (await getAndroidSdk())! >= 29) {
      return Permission.activityRecognition;
    } else {
      return Permission.sensors;
    }
  }

  Future<int?> getAndroidSdk() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var sdkInt = androidInfo.version.sdkInt;
      return sdkInt;
    }
    return 0;
  }

  Future<void> initPlatformState() async {
    Permission motionPermission = await getMotionPermission();
    if (!await motionPermission.isGranted) {
      var newStatus = await motionPermission.request();
      if (!newStatus.isGranted) return Future.error('Permission not granted');
    }

    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      const SizedBox(
        height: 20,
      ),
      const Text(
        'Steps taken:',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
      Text(
        _status,
        style: _status == 'walking' || _status == 'stopped'
            ? const TextStyle(fontSize: 30)
            : const TextStyle(fontSize: 20, color: accentColor),
      ),
    ]);
  }
}
