import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constants.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../create_new_password/views/create_new_password_screen.dart';

class OtpScreenServices extends GetxController {
  final firstDigitOtp = TextEditingController();
  final secondDigitOtp = TextEditingController();
  final thirdOtp = TextEditingController();
  final fourthDigitOtp = TextEditingController();
  final fifthDigitOtp = TextEditingController();
  final sixthDigitOtp = TextEditingController();
  late String otpText;
  late String enteredEmail;
  RxBool continueButtonPressed = false.obs;

  formValidationOtpScreen() {
    otpText =
        firstDigitOtp.text + secondDigitOtp.text + thirdOtp.text + fourthDigitOtp.text + fifthDigitOtp.text + sixthDigitOtp.text;
    if (otpText.length == 6) {
      apiOtpCheck(email: enteredEmail, otp: otpText);
    } else {
      showToast(
        center: true,
        TrKeys.pleaseEnterSixDigitOTP.name.tr,
        showToastInReleaseMode: true,
        toastBackGroundColor: kColorRedLight,
        iconAsset: "images/icons/infoRed.png",
      );
    }
  }

  Future<void> apiOtpCheck({required String email, required String otp}) async {
    continueButtonPressed.value = true;
    try {
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
          apiUrl: "",
          body: {
            "email": email.trim(),
            "otp": otp.trim(),
          },
          tokenRequired: false);

      if (decoded == null) return;

      if (decoded["response"] == 1) {
        Get.to(() => const CreateNewPasswordScreen(),
            arguments: NewPasswordScreenArgumentModel(email: enteredEmail.trim(), otp: otpText.trim()),
            transition: Transition.noTransition);
      } else if (decoded["response"] == "please enter the valid code") {
        showToast(
            center: true,
            TrKeys.invalidOTPProvidedPleaseTryAgain.name.tr,
            showToastInReleaseMode: true,
            toastBackGroundColor: kColorRedLight,
            iconAsset: "images/icons/infoRed.png",
            duration: const Duration(seconds: 5));
      } else if (decoded["response"] == "Time limit exceed") {
        showToast(
            center: true,
            TrKeys.timeLimitExceededPleaseClickOnResendVerificationCodeToGetNewOTP.name.tr,
            showToastInReleaseMode: true,
            toastBackGroundColor: kColorRedLight,
            iconAsset: "images/icons/infoRed.png",
            duration: const Duration(seconds: 5));
      }
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
    continueButtonPressed.value = false;
  }
}

class NewPasswordScreenArgumentModel {
  String email;
  String otp;

  NewPasswordScreenArgumentModel({required this.email, required this.otp});
}
