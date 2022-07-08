import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Future myLoadAsset(String name) async {
    try {
      String activityName = name.toLowerCase();
      String assetPath = "assets/svgs/swimming.svg";
      return await rootBundle.loadString(assetPath);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (SizedBox(
      child: FutureBuilder(
          future: myLoadAsset(widget.activityName),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                SvgPicture.asset(
                    "assets/svgs/${widget.activityName.toLowerCase()}.svg",
                    width: size.width * 0.35,
                    color: accentColor)
              ];
            } else {
              children = <Widget>[
                SvgPicture.asset(
                  "assets/svgs/default.svg",
                  width: size.width * 0.30,
                  color: accentColor,
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          }),
    ));
  }
}
