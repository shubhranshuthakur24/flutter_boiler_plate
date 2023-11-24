import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/font_styles.dart';
import '../../../../styles/k_icons.dart';
import '../../../side_menu/views/widgets/on_hover_widget.dart';

class SubmitWidget extends StatelessWidget {
  const SubmitWidget({
    Key? key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return customInkWell(
      child: OnHover(
        builder: (isHovered) {
          final borderColor = isHovered ? kColorMaroon : kColorTransparent;
          final textColor = isHovered ? kColorMaroon : kColorWhite;
          final backgroundColor = isHovered ? kColorMaroonLight : kColorMaroon;

          return Container(
            margin: const EdgeInsets.only(top:10),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: 145,
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: borderColor, width: 1), // Add border based on isHovered
              ),
            ),
            child: Center(
              child: Text(
                'Submit',
                style: kFontNotoSans.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
          );
        },
      ),
      onTap: () {
        onSubmit();
      },
    );
  }
}
