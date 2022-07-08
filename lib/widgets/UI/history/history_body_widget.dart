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

  List<String> dateArray = [
    '2022-06-30',
    '2022-06-29',
    '2022-06-28',
    '2022-06-27',
    '2022-06-26'
  ];
  List<String> nameArray = [
    'Running',
    'Cycling',
    'Walking',
    'Running',
    'Swimming',
    'Hiking'
  ];
  int preferedLength = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
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
          FutureBuilder(
              future: _activityList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    for (ActivityModel activity in snapshot.data)
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
              })

          /*if (dateArray.length <= nameArray.length)
            for (int i = 0; i < dateArray.length; i++)
              HistoryCardWidget(
                  dateOfActivity: dateArray[i], nameOfActivity: nameArray[i]),
          if (dateArray.length > nameArray.length)
            for (int i = 0; i < nameArray.length; i++)
              HistoryCardWidget(
                  dateOfActivity: dateArray[i], nameOfActivity: nameArray[i]),
        */
        ],
      ),
    ));
  }
}
