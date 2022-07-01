import 'package:flutter/material.dart';
import 'package:tracking_app/screens/profile_change_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

class ProfileBodyWidget extends StatefulWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  State<ProfileBodyWidget> createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends State<ProfileBodyWidget> {
  //variables which have to be filled with database
  final String _firstname = 'abc';
  final String _lastname = 'def';
  final String _dateofbirth = 'ghi';
  final String _gender = 'jkl';
  final String _town = 'mno';
  final String _zip = 'pqr';
  final String _streetno = 'stu';
  final String _height = 'vwx';
  final String _weight = 'yza';

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "My Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          const SizedBox(
            height: 25,
          ),
          const Icon(Icons.account_circle_rounded, color: secondery, size: 75),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Firstname:',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Lastname:',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Date of birth:',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Gender:',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Town:',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'ZIP:',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Street, no:',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Height(cm):',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Weight(kg):',
                    style: TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _firstname,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _lastname,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _dateofbirth,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _gender,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _town,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _zip,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _streetno,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _height,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _weight,
                    style: const TextStyle(
                      height: 2.5,
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          RoundedButtonWidget(
              text: 'Edit personal information',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileChangeScreen();
                }));
              },
              color: accentColor,
              textColor: Colors.white),
        ],
      ),
    ));
  }
}
