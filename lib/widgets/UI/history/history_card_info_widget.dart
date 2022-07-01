import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tracking_app/screens/UI/nav_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_Button_widget.dart';

class HistoryCardInfoWidget extends StatefulWidget {
  final String dateOfActivity;
  final String nameOfActivity;
  const HistoryCardInfoWidget(
      {Key? key, required this.dateOfActivity, required this.nameOfActivity})
      : super(key: key);

  @override
  State<HistoryCardInfoWidget> createState() => _HistoryCardInfoWidgetState();
}

class _HistoryCardInfoWidgetState extends State<HistoryCardInfoWidget> {
  final double _drawnProgress =
      0.56; //TODO: hier Fortschritt der Aktivität aus Datenbank eingeben
  final String _progress =
      '56 of 100 days'; //TODO: hier die jeweilige Zahl aus der Datenbank einfügen

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.nameOfActivity,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: CircularPercentIndicator(
              radius: 60,
              percent: _drawnProgress,
              animation: true,
              animationDuration: 1000,
              progressColor: accentColor,
              center: Text(
                _progress,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(widget.dateOfActivity),
          Text(widget.nameOfActivity),
          const SizedBox(
            height: 15,
          ),
          RoundedButtonWidget(
              text: 'Back',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NavScreen();
                }));
              },
              color: accentColor,
              textColor: Colors.white),
        ],
      ),
    ));
  }
}
