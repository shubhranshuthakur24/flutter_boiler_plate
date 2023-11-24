import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../modules/chat_with_claude_model/services/chat_with_claude_model_screen_services.dart';
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