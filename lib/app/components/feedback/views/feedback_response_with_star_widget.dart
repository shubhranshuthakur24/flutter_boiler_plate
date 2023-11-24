import 'package:flutter_boiler_plate/app/components/side_menu/views/widgets/on_hover_widget.dart';
import 'package:flutter_boiler_plate/app/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../styles/constants.dart';
import '../../../styles/font_styles.dart';
import '../../../styles/k_icons.dart';

class FeedBackResponseWithStarWidget extends StatelessWidget {
  const FeedBackResponseWithStarWidget({
    super.key,
    required this.starRatingWidget,
    required this.starWidget,
    required this.ratingTextWidget,
    required this.userFeedbackWidget,
    required this.submitWidget,
    required this.onTapCrossButton,
  });

  final Widget starRatingWidget;
  final Widget starWidget;
  final Widget ratingTextWidget;
  final Widget userFeedbackWidget;
  final Widget submitWidget;
  final void Function() onTapCrossButton; // Define the onTap callback


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWhite,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.only(bottom: 15),
        decoration: ShapeDecoration(
          color: kColorMaroonLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Image(
                    alignment: Alignment.centerLeft,
                    height: 25,
                    width: 30,
                    image: AssetImage(
                        "images/icons/stanford_logo_without_text.png"),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Text(
                          'Please rate your chat experience:',
                          style: kFontNotoSans.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: kColorBlack,
                          ),
                          softWrap: true, // Allow text to wrap to the next line
                        ),
                      ),
                      Row(
                        children: [
                          starWidget,
                          starRatingWidget,
                        ],
                      ),
                      const SizedBox(height: 10,),
                      ratingTextWidget,
                      const SizedBox(height: 10,),
                      userFeedbackWidget,
                      const SizedBox(height: 10,),
                      submitWidget,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OnHover(
                      builder: (isHovered) {
                        return customInkWell(
                          onTap: () {
                            onTapCrossButton();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                            alignment: Alignment.topRight,
                            child: Icon(
                              color:isHovered?kColorMaroon:kColorGray.withOpacity(0.4),
                              crossIcon,
                              size: 24,
                            ),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
