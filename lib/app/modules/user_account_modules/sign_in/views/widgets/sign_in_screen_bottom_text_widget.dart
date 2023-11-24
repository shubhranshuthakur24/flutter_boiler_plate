import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../styles/colors.dart';
import '../../../../../styles/constants.dart';
import '../../../../../styles/k_icons.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../../../../utils/url_launcher/url_launcher.dart';

var TextSize = 12;

class SignInScreenBottomTextWidget extends StatelessWidget {
  const SignInScreenBottomTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            TrKeys.byLoggingInYouAgreeTo.name.tr,
            style: TextStyle(
                fontFamily: constantOpenSans, fontWeight: FontWeight.w300, fontSize: TextSize.toDouble(), color: kColorBlack),
          ),
          customInkWell(
            onTap: () {
              UrlLauncher.launchURL(openInBrowser: true, "https://givers.health/terms-of-service");
            },
            child: Text(
              TrKeys.termsOfService.name.tr,
              style: TextStyle(
                color: kColorBlueDark,
                fontWeight: FontWeight.w300,
                fontSize: TextSize.toDouble(),
              ),
            ),
          ),
          Text(
            "${TrKeys.and.name.tr} ",
            style: TextStyle(
                fontFamily: constantOpenSans, fontWeight: FontWeight.w300, fontSize: TextSize.toDouble(), color: kColorBlack),
          ),
          customInkWell(
            onTap: () {
              UrlLauncher.launchURL(openInBrowser: true, "https://givers.health/privacy-policy");
            },
            child: TermsOfUseTextColored(
              text: TrKeys.privacyPolicy.name.tr,
            ),
          )
        ],
      ),
    );
  }
}
