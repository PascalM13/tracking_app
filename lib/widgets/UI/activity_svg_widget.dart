import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tracking_app/theme/colors.dart';

/// Widget-Class to load a SVG for a given Activity, by trying to get a svg from Acitivity Name, if no assets has been found, it retruns a default svg
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
      // ignore: unused_local_variable
      String activityName = name.toLowerCase();
      String assetPath = "assets/svgs/${widget.activityName.toLowerCase()}.svg";
      String rootBudle = await rootBundle.loadString(assetPath);
      return rootBudle;
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
                  width: size.width * 0.50,
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
