import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

/// Widget-Class for Displaying a Rounded Dropdown Button which looks like an Icon
// ignore: must_be_immutable
class RoundButtonIconWidget extends StatefulWidget {
  bool isDisabled;
  IconData iconData;
  final VoidCallback onPress;

  RoundButtonIconWidget(
      {Key? key,
      required this.isDisabled,
      required this.iconData,
      required this.onPress})
      : super(key: key);

  @override
  State<RoundButtonIconWidget> createState() => _RoundButtonIconWidgetState();
}

class _RoundButtonIconWidgetState extends State<RoundButtonIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: primary,
      child: Center(
        child: Ink(
          decoration: ShapeDecoration(
            color: widget.isDisabled ? secondery : accentColor,
            shape: const CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(widget.iconData),
            color: Colors.white,
            onPressed: () {
              setState(() {
                if (widget.isDisabled == false) {
                  widget.onPress();
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
