import 'package:flutter_boiler_plate/app/styles/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../routes/screen_names.dart';
import '../../../../utils/device_related/device_info_services.dart';
import '../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../signup/services/firebase_auth_signIn_mixin.dart';

class SignInScreenServices extends GetxController with FirebaseAuthSignInWithEmailAndPasswordMixin {
  final RxBool signInButtonPressed = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPassword = GlobalKey<FormState>();

  // final String userNotFoundSentence = tKeyName.sorryWeDontRecognizeThatEmailOrPasswordYouCanTryAgainOrResetYourPassword.name.tr;
  @override
  void onInit() {
    // This is the onInit method, it will be called automatically when the controller is initialized.
    super.onInit(); // Don't forget to call super.onInit() to ensure proper initialization of the controller.
    emailController.text = "testaccshubh101@gmail.com";
    passwordController.text = "Testing123!";
    // Initialize any variables or perform setup here\
  }
  textFieldValidation() async {
    formKey.currentState?.validate();
    formKeyPassword.currentState?.validate();
    if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
      } else {}
    } else if (passwordController.text.isEmpty) {
    } else {
      signInButtonPressed.value = true;
      firebaseAuthSignInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      // Get.offAllNamed(ScreenNames.chat.name);

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

  String? returnValuePassword() {
    if (passwordController.text.isEmpty) {
      return TrKeys.passwordCantBeEmpty.name.tr;
    }
    return null;
  }

  Future<void> apiLogin({required String email, String? password, String? signInType, required String firebaseId}) async {
    // await Get.find<TokenServices>();
    // String res = "";
    Get.delete<SignInScreenServices>();
    Get.offAllNamed(ScreenNames.home.routeName);
    // loginApiHit();
    return;
  }
}

Future<Map<String, dynamic>?> loginApiHit() async {
  Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(apiUrl: ApiEndpoints.loginApiUrl, body: {
    "device_info": await DeviceInfoServices.getDeviceInfo(),
    "device_channelid": DeviceInfoServices.getDeviceChannelId(),
    // if (!GetPlatform.isWeb) "device_token": await FirebaseMessaging.instance.getToken()
  });
  return decoded;
}
