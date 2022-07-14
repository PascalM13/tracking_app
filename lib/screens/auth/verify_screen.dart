import 'package:flutter/material.dart';

import '../../widgets/auth/register/verify_body_widget.dart';

///Screen for verifying, where the widget is opened
class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyBodyWidget(),
    );
  }
}
