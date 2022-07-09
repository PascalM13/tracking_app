import 'package:flutter/material.dart';
import 'package:tracking_app/models/acitvity_type/activity_type_model.dart';
import 'package:tracking_app/models/activity/activity_dto.dart';
import 'package:tracking_app/services/activity_service.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';

import '../../../models/user/user_model.dart';
import '../../../screens/UI/nav_screen.dart';
import '../../../theme/colors.dart';
import '../input_fields/input_field_widget.dart';
import '../rounded_button_widget.dart';

// ignore: must_be_immutable
class ActivitySaveBodyWidget extends StatefulWidget {
  int? steps;
  final String duration;
  final DateTime start;
  final DateTime end;
  final ActivityTypeModel activityTypeModel;

  ActivitySaveBodyWidget(
      {Key? key,
      required this.duration,
      required this.start,
      required this.end,
      required this.activityTypeModel,
      this.steps})
      : super(key: key);

  @override
  State<ActivitySaveBodyWidget> createState() => _ActivitySaveBodyWidgetState();
}

class _ActivitySaveBodyWidgetState extends State<ActivitySaveBodyWidget> {
  final _heartrateController = TextEditingController();
  final _distanceController = TextEditingController();
  final _bloodsugarController = TextEditingController();

  _saveActivity() async {
    var user = await UserModel().getCurrentUser();

    var dto = ActivityDto(
        startDate: widget.start.millisecondsSinceEpoch,
        endDate: widget.end.millisecondsSinceEpoch,
        userId: user.id!,
        activityTypeId: widget.activityTypeModel.id,
        projectId: 2,
        hearthrate: 123,
        steps: 123);

    var savedAcitivity = await const ActivityService().createActivity(dto);

    print(widget.start);
    print(widget.start.millisecondsSinceEpoch);

    if (!mounted) return;

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const NavScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("You finished your ${widget.activityTypeModel.name} Workout",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          const Text("Now fill out the missing Data of your Activity!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const SizedBox(
            height: 25,
          ),
          InputFieldWidget(
              hintText: "Heartrate",
              icon: Icons.favorite,
              inputController: _heartrateController,
              keyboardtType: TextInputType.number),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
            hintText: "Distance",
            icon: Icons.directions_run_rounded,
            inputController: _distanceController,
            keyboardtType: TextInputType.number,
          ),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
            hintText: "Blood Sugar Oxygen",
            icon: Icons.bloodtype_outlined,
            inputController: _bloodsugarController,
            keyboardtType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: 'Save',
              onPress: () {
                _saveActivity();
              },
              color: accentColor,
              textColor: Colors.white),
          RoundedButtonWidget(
              text: 'Cancel',
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
