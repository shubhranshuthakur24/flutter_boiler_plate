import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/constants.dart';
import '../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../../../utils/internationalization_using_getx/translations.dart';
import '../../signup/views/signup_screen.dart';
import 'mixin_upid_code_should_auto_fill_via_url.dart';

class ReferralCodeServices extends GetxController with UpidCodeShouldAutoFillViaURL {
  RxBool isVerificationButtonPressed = false.obs;
  TextEditingController referralEditingController = TextEditingController(text: _getDefaultUpCodeBasedOnSelectedLanguage());

  RxString referralCode = _getDefaultUpCodeBasedOnSelectedLanguage().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
    extractUpidCodeFromUrl();
  }

  Future<String> apiverifyReferralCode({required String referralCode}) async {
    referralEditingController.text = referralCode.trim();
    isVerificationButtonPressed.value = true;
    String res = "";
    referralCode = _appendLanguageCodeToEndBasedOnSelectdLanguageForCalgrows(referralCode);
    try {
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
          apiUrl: ApiEndpoints.signUpApiUrl,
          body: {"upcode": referralCode.toString().trim().toLowerCase()},
          tokenRequired: false);

      if (decoded == null) return res;

      if (decoded["response"] == "success") {
        hideLoading();
        languageChangeBasedOnUpid(upid: referralCode.toString().tr.toLowerCase());
        Get.to(() => const SignUpScreen(), arguments: [referralCode.toString().trim()], transition: Transition.noTransition);
      } else {
        showToast(
            center: true,
            TrKeys.pleaseEnterRightReferralCode.name.tr,
            showToastInReleaseMode: true,
            toastBackGroundColor: kColorRedLight,
            iconAsset: "images/icons/infoRed.png");
      }
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
      showToast(center: true, error.toString(), showToastInReleaseMode: true);
    }
    isVerificationButtonPressed.value = false;
    return res;
  }

  String _appendLanguageCodeToEndBasedOnSelectdLanguageForCalgrows(String referralCode) {
    if (referralCode.startsWith("calgrows") && !referralCode.trim().endsWith("_es") && !referralCode.trim().endsWith("_en")) {
      referralCode = "${referralCode.trim()}_${selectedPreferredLanguageMapping.languageCode.trim()}";
    }
    return referralCode;
  }
}

String _getDefaultUpCodeBasedOnSelectedLanguage() {
  if (!kBuildForCalgrows) return "";
  return selectedPreferredLanguageMapping.languageId == 1 ? "calgrows_en" : "calgrows_es";
}
