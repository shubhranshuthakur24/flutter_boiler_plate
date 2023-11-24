import 'package:flutter/material.dart';

import '../../../../../styles/colors.dart';
import '../../../../../styles/constant_font_size.dart';
import '../../../../../styles/constants.dart';

class PasswordParametersWidget extends StatefulWidget {
  const PasswordParametersWidget({Key? key}) : super(key: key);

  @override
  _PasswordParametersWidgetState createState() => _PasswordParametersWidgetState();
}

class _PasswordParametersWidgetState extends State<PasswordParametersWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: "Has at least 8 characters"),
        textWidget(text: "Has letters, numbers, and special characters"),
        textWidget(text: "Not easy to guess")
      ],
    );
  }
}

textWidget({required String text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "• ",
        style: TextStyle(fontSize: kFontSize16, fontWeight: FontWeight.w900, color: kColorBlack),
      ),
      Text(
        text,
        style: TextStyle(fontFamily: constantLato, fontSize: kFontSize13, fontWeight: FontWeight.w400),
      )
    ],
  );
}
