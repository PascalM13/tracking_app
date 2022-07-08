import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

import 'package:tracking_app/theme/colors.dart';

class ActivitySVGWidget extends StatefulWidget {
  final String activityName;
  const ActivitySVGWidget({Key? key, required this.activityName})
      : super(key: key);

  @override
  State<ActivitySVGWidget> createState() => _ActivitySVGWidgetState();
}

class _ActivitySVGWidgetState extends State<ActivitySVGWidget> {
  String getSVGPath(String activityName) {
    //TODO Check function doesnt work. Check if asset exists!
    String name = activityName.toLowerCase();
    String assetPath = "assets/svgs/$name.svg";
    print(assetPath);
    bool syncPath = File("../../../" + assetPath).existsSync();

    if (syncPath) {
      return assetPath;
    } else {
      return "assets/svgs/default.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (SizedBox(
      child: SvgPicture.asset(
        getSVGPath(widget.activityName),
        color: accentColor,
        height: size.height * 0.35,
      ),
    ));
  }
}
