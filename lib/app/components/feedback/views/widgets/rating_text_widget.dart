import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/font_styles.dart';

class RatingTextWidget extends StatelessWidget {
  const RatingTextWidget({
    super.key,
    required this.textBasedOnInput,
  });

  final String textBasedOnInput;

  @override
  Widget build(BuildContext context) {
    return  Text(
      textBasedOnInput,
      style: kFontNotoSans.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: kColorBlack,
      ),
      softWrap: true, // Allow text to wrap to the next line
    );
  }
}