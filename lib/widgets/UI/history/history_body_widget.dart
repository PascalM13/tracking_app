import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/history/history_card_widget.dart';

class HistoryBodyWidget extends StatefulWidget {
  const HistoryBodyWidget({Key? key}) : super(key: key);

  @override
  State<HistoryBodyWidget> createState() => _HistoryBodyWidgetState();
}

class _HistoryBodyWidgetState extends State<HistoryBodyWidget> {
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
          if (dateArray.length <= nameArray.length)
            for (int i = 0; i < dateArray.length; i++)
              HistoryCardWidget(
                  dateOfActivity: dateArray[i], nameOfActivity: nameArray[i]),
          if (dateArray.length > nameArray.length)
            for (int i = 0; i < nameArray.length; i++)
              HistoryCardWidget(
                  dateOfActivity: dateArray[i], nameOfActivity: nameArray[i]),
        ],
      ),
    ));
  }
}
