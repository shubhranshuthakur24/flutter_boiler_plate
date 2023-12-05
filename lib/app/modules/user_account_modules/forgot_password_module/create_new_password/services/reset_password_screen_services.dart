import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../../styles/constants.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../request_reset_password/services/request_reset_password_services.dart';

class ResetPasswordScreenServices {
  static String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExpPassword = RegExp(pattern);
  RxBool requestPasswordButtonPressed = false.obs;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKeyPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyConfirmPassword = GlobalKey<FormState>();
  late String enteredEmail;
  late String enteredOtp;

  String? passwordStringReturn() {
    if (!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7) ||
        !regExpPassword.hasMatch(passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7))) {
        return TrKeys.passwordMinimumLengthShouldBeEightCharacter.name.tr;
      } else {
        return TrKeys.passwordMustContainsOneUpperCaseOneLowerCaseOneNumericalAndOneSpecialCharacter.name.tr;
      }
    }
    return null;
  }

  String? confirmPasswordStringReturn() {
    if (passwordController.text.trim().isEmpty) {
      return TrKeys.confirmPasswordCantBeEmpty.name.tr;
    } else if (confirmPasswordController.text.trim() != passwordController.text.trim()) {
      return TrKeys.passwordAndConfirmPasswordAreNotSame.name.tr;
    }
    return null;
  }

  formValidationNewPasswordScreen() {
    formKeyPassword.currentState?.validate();
    formKeyConfirmPassword.currentState?.validate();
    if (!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7) ||
        !regExpPassword.hasMatch(passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7))) {
      } else {}
    } else if (confirmPasswordController.text.isEmpty) {
    } else if (passwordController.text == confirmPasswordController.text) {
      resetPassword();
    } else {}
  }

  Future<void> resetPassword() async {
    requestPasswordButtonPressed.value = true;

    Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
        apiUrl: "",
        body: {"key": enteredOtp, "password": passwordController.text.trim(), "username": enteredEmail},
        tokenRequired: false);

    requestPasswordButtonPressed.value = false;
    if (decoded == null) return;

    if (decoded["response"] == "Password reset successfully.") {
      showToast(
        TrKeys.passwordResetSuccessfully.name.tr,
        showToastInReleaseMode: true,
        center: true,
      );
      disposeCustom();
      Get.offAllNamed("/");
      return;
    }

    // showToast(
    //   center: true,
    //   decoded["response"],
    //   showToastInReleaseMode: true,
    //   // center: true,
    //   toastBackGroundColor: kColorRedLight,
    //   iconAsset: "images/icons/infoRed.png",
    // );
  }

  disposeCustom() {
    Get.delete<RequestResetPasswordServices>();
    Get.delete<ResetPasswordScreenServices>();
  }
}
