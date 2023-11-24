import 'package:flutter/material.dart';

import '../../../../../../styles/font_styles.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key, required this.heading, required this.icon}) : super(key: key);
  final String heading;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "images/icons/$icon",
          width: 18,
          height: 18,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          heading,
          style: kFontPoppinsS15W400SH2,
        )
      ],
    );
  }
}
