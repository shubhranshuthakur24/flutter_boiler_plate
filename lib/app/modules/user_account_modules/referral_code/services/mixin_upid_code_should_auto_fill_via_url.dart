import 'package:flutter_boiler_plate/app/modules/user_account_modules/referral_code/services/referral_code_services.dart';
import 'package:get/get.dart';

import '../../../../styles/constants.dart';
import '../../../../utils/internationalization_using_getx/preferred_language_mapping.dart';
import '../../../../utils/internationalization_using_getx/translations.dart';

mixin UpidCodeShouldAutoFillViaURL {
  void extractUpidCodeFromUrl() {
    if (!kBuildForCalgrows) return;
    try {
      Uri uri = Uri.parse(Uri.base.toString());
      if (uri.queryParameters.containsKey('upid')) {
        String? upid = uri.queryParameters['upid'];
        languageChangeBasedOnUpid(upid: upid);
        if (upid != null) Get.find<ReferralCodeServices>().apiverifyReferralCode(referralCode: upid);
      }
    } catch (error) {}
  }

  void languageChangeBasedOnUpid({String? upid}) {
    if (upid != null) {
      if (upid.endsWith("_en")) {
        changeLanguageAndStoreInLocalDb(
            preferredLanguageMapping: preferredLanguageList.firstWhere((element) => element.languageCode == "en"));
      } else if (upid.endsWith("_es")) {
        changeLanguageAndStoreInLocalDb(
            preferredLanguageMapping: preferredLanguageList.firstWhere((element) => element.languageCode == "es"));
      }
    }
  }
}
