import 'package:chat_app/app/styles/colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../styles/font_styles.dart';

class FeedBackResponseWidget extends StatelessWidget {
  const FeedBackResponseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.only( bottom: 15),
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
                  height:  25,
                  width:  30,
                  image: AssetImage("images/icons/stanford_logo_without_text.png"),
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
                        'Thank you for the information. Based on your responses, we will assess the severity of your condition. Please wait for a moment.',
                        style: kFontNotoSans.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: kColorBlack,
                        ),
                        softWrap: true, // Allow text to wrap to the next line
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        'System: Severity Assessment Result:',
                        style: kFontNotoSans.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: kColorBlack,
                        ),
                        softWrap: true, // Allow text to wrap to the next line
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child:  Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Medium Severity:\n',
                              style: kFontNotoSans.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: kColorBlack,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 35), // Add spacing using WidgetSpan
                            ),
                            TextSpan(
                              text: "Based on the information provided, your condition is of moderate severity. It's essential to seek urgent medical attention. We recommend visiting the emergency room as soon as possible. Please be prepared for a short wait upon arrival.",
                              style: kFontNotoSans.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: kColorBlack,
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
