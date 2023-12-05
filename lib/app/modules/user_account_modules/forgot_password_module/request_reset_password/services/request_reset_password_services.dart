import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constants.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../otp/views/otp_screen.dart';

class RequestResetPasswordServices {
  final emailController = TextEditingController();
  RxBool requestPasswordButtonPressed = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // late String sendedVerificationCode;

  void emailTextValidation() {
    formKey.currentState?.validate();
    if (emailController.text.toString().isEmpty) {
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
    } else {
      requestResetPassword();
    }
  }

  String? returnValue() {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
        return TrKeys.emailCantBeEmpty.name.tr;
      } else {
        return TrKeys.pleaseEnterValidEmail.name.tr;
      }
    }
    return null;
  }

  Future<void> requestResetPassword() async {
    requestPasswordButtonPressed.value = true;

    Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
        apiUrl: "",
        body: {
          "country_code": "12345",
          "username": emailController.text.toString().trim(),
        },
        tokenRequired: false);

    requestPasswordButtonPressed.value = false;
    if (decoded == null) return;

    if (decoded["response"] == "OTP Sent Successful") {
      Get.to(() => const OTPScreen(), arguments: emailController.text.trim(), transition: Transition.noTransition);
    } else {
      showToast(
          center: true,
          TrKeys.emailNotFoundPleaseUseTheEmailAssociatedWithYourAccount.name.tr,
          showToastInReleaseMode: true,
          toastBackGroundColor: kColorRedLight,
          iconAsset: "images/icons/infoRed.png",
          duration: const Duration(seconds: 5));
    }
  }
}
