import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../styles/colors.dart';
import '../../../../../styles/constants.dart';
import '../../../../../styles/font_styles.dart';
import '../../../../../styles/k_icons.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../../../../utils/url_launcher/url_launcher.dart';

class PopupScreenForCalgrows extends StatelessWidget {
  const PopupScreenForCalgrows({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 564,
      // height: 350,
      padding: EdgeInsets.all(context.isPhone ? 18 : 40),
      child: Column(
        children: [
          customInkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.topRight,
              child: const Icon(
                crossIcon,
                size: 22,
              ),
            ),
          ),
          SizedBox(
            height: context.isPhone ? 17 : 28,
          ),
          IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: TrKeys.forEnglish.name.tr,
                            style: kFontNotoSansS18W400Para1.copyWith(fontWeight: FontWeight.w700, color: kColorBlack)),
                        TextSpan(
                            text: " ${TrKeys.pleaseUseTheUPID.name.tr} calgrows_en",
                            style: kFontNotoSansS18W400Para1.copyWith(color: kColorBlack)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.isPhone ? 23 : 25,
                ),
                SizedBox(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: TrKeys.forSnapnish.name.tr,
                            style: kFontNotoSansS18W400Para1.copyWith(fontWeight: FontWeight.w700, color: kColorBlack)),
                        TextSpan(
                            text: " ${TrKeys.pleaseUseTheUPID.name.tr} calgrows_es",
                            style: kFontNotoSansS18W400Para1.copyWith(color: kColorBlack)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.isPhone ? 43 : 49,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: customInkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      alignment: context.isPhone ? Alignment.center : null,
                      width: context.isPhone ? double.infinity : null,
                      padding: const EdgeInsets.symmetric(horizontal: 88, vertical: 16),
                      decoration: BoxDecoration(color: kColorBlueDark, borderRadius: BorderRadius.circular(37)),
                      child: Text(
                        TrKeys.close.name.tr,
                        style: kFontNotoSansS15W600Button1.copyWith(color: kColorWhite),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.isPhone ? 16 : 26,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: customInkWell(
                      child: Text(
                        TrKeys.emailSupport.name.tr,
                        style: kFontNotoSansS15W600Button1,
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        UrlLauncher.emailLauncher("support@givers.health");
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
