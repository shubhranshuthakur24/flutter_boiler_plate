import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../styles/colors.dart';
import '../../../../../styles/constant_font_size.dart';
import '../../../../../styles/constants.dart';
import '../../../../../styles/k_icons.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../../../../utils/url_launcher/url_launcher.dart';
import '../referal_code_screen.dart';

class PopupScreenForCaregiverWidget extends StatelessWidget {
  const PopupScreenForCaregiverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidthAlertDailog,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                size: 27,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextTitle(text: TrKeys.howDoIKnowIfIHaveAUniqueProgramID.name.tr),
          const SizedBox(
            height: 5,
          ),
          BodyTitle(
              text: TrKeys
                  .ifGiversHealthWasRecommendedByADoctorOrClinicianInsuranceProviderOrEmployeeHealthPortalYouMayHaveOne.name.tr),
          const SizedBox(
            height: 15,
          ),
          TextTitle(text: TrKeys.whereWouldIFindIt.name.tr),
          const SizedBox(
            height: 5,
          ),
          BodyTitle(
              text: TrKeys
                  .youShouldHaveReceivedYourUniqueProgramIDUPIDByMailEmailOrTextIfYoureHavingTroubleFindingItAndNeedHelpContactUs
                  .name
                  .tr),
          const SizedBox(
            height: 15,
          ),
          customInkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              color: kColorBlueDark,
              alignment: Alignment.center,
              child: Text(
                TrKeys.close.name.tr,
                style: TextStyle(fontSize: kFontSize24, fontFamily: constantPoppins, color: kColorWhite),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          customInkWell(
            onTap: () {
              UrlLauncher.emailLauncher("support@givers.health");
            },
            child: Text(
              TrKeys.emailSupport.name.tr,
              style: TextStyle(fontSize: kFontSize24, fontFamily: constantLato, color: kColorBlueDark),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
