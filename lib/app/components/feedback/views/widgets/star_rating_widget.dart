import 'package:flutter/material.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/font_styles.dart';

class StarRatingWidget extends StatelessWidget {
   const StarRatingWidget({
    super.key,
    required this.starRating ,
  });

  final int starRating ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Text(
        '$starRating Rating',
        style: kFontNotoSans.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: kColorBlack,
        ),
        softWrap: true, // Allow text to wrap to the next line
      ),
    );
  }
}