import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/home/expansion_panel_list_widget.dart';
import 'package:tracking_app/widgets/UI/home/percent_indicator_activity_widget.dart';
import 'package:tracking_app/widgets/UI/home/percent_indicator_days_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Welcome to the study",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: accentColor,
              fontSize: 25.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Relationship between diabetes and fitness", //TODO: hier Name aus Datenbank einfügen
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black45,
                fontSize: 21.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Your own progress:',
            style: TextStyle(
              height: 2.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const PercentIndicatorDayWidget(),
          const SizedBox(
            height: 15,
          ),
          const PercentIndicatorActivityWidget(),
          const SizedBox(
            height: 30,
          ),
          const ExpansionPanelListWidget(),
        ],
      ),
    ));
  }
}
