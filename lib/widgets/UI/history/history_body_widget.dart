import 'package:flutter/material.dart';
import 'package:tracking_app/models/activity/activity_model.dart';
import 'package:tracking_app/services/activity_service.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/history/history_card_widget.dart';

class HistoryBodyWidget extends StatefulWidget {
  const HistoryBodyWidget({Key? key}) : super(key: key);

  @override
  State<HistoryBodyWidget> createState() => _HistoryBodyWidgetState();
}

class _HistoryBodyWidgetState extends State<HistoryBodyWidget> {
  final Future<List<ActivityModel>> _activityList =
      const ActivityService().getActivities();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenBackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "History",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          Image.asset(
            'assets/images/login_screen.jpg',
            height: size.height * 0.3,
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  height: size.height * 0.4,
                  child: FutureBuilder(
                      future: _activityList,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<ActivityModel>> snapshot) {
                        List<Widget> children;
                        if (snapshot.hasData) {
                          children = <Widget>[
                            for (ActivityModel activity
                                in snapshot.data!.reversed)
                              HistoryCardWidget(
                                activityModel: activity,
                              )
                          ];
                        } else if (snapshot.hasError) {
                          children = <Widget>[
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Error: Failed to load Activities'),
                            )
                          ];
                        } else {
                          children = const <Widget>[
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Awaiting result...'),
                            )
                          ];
                        }
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: children,
                          ),
                        );
                      })))
        ],
      ),
    );
  }
}
