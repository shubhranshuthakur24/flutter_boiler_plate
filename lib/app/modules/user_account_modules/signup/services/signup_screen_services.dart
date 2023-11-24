import 'dart:convert';
import 'dart:math';

import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/services/signup_with_google_services_mixin.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../styles/constants.dart';
import '../../../../utils/device_related/device_info_services.dart';
import '../../../../utils/internationalization_using_getx/tr_keys.dart';
import 'firebase_auth_signup_mixin.dart';

class SignupScreenServices extends GetxController with FirebaseAuthSignUpWithEmailAndPasswordMixin{
  final RxBool buttonPressed = false.obs;

  String dropdownValue = '+47 Norway';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordConfirmController = TextEditingController();
  GlobalKey<FormState> formKeyFirstName = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLasttName = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyConfirmPassword = GlobalKey<FormState>();
  static String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExpPassword = RegExp(pattern);
  late String referralCode;

  String? firstNameStringReturn() {
    if (firstNameController.text.trim().isEmpty) {
      return TrKeys.firstNameCantBeEmpty.name.tr;
    }
    return null;
  }

  String? lastNameStringReturn() {
    if (lastNameController.text.trim().isEmpty) {
      return TrKeys.lastNameCantBeEmpty.name.tr;
    }
    return null;
  }

  String? emailStringReturn() {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
        return TrKeys.emailCantBeEmpty.name.tr;
      } else {
        return TrKeys.pleaseEnterValidEmail.name.tr;
      }
    }
    return null;
  }

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
    if (confirmPasswordConfirmController.text.trim().isEmpty) {
      return TrKeys.confirmPasswordCantBeEmpty.name.tr;
    } else if (confirmPasswordConfirmController.text.trim() != passwordController.text.trim()) {
      return TrKeys.passwordAndConfirmPasswordAreNotSame.name.tr;
    }
    return null;
  }

  ///Text Form Field Validator
  void textFieldValidation() {
    formKeyFirstName.currentState?.validate();
    formKeyLasttName.currentState?.validate();
    formKeyEmail.currentState?.validate();
    formKeyPassword.currentState?.validate();
    formKeyConfirmPassword.currentState?.validate();
    if (firstNameController.text.trim().isEmpty) {
    } else if (lastNameController.text.trim().isEmpty) {
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
      } else {}
    } else if (!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7) ||
        !regExpPassword.hasMatch(passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7))) {
      } else {}
    } else if (confirmPasswordConfirmController.text.trim().isEmpty) {
    } else if (passwordController.text == confirmPasswordConfirmController.text) {
      buttonPressed.value = true;

      firebaseSignUpWithEmailAndPassword();
    } else {}
  }

  // Future appleSignUPPasswordLess({required BuildContext context}) async {
  //   showLoading();
  //   try {
  //     String generateNonce([int length = 32]) {
  //       const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //       final random = Random.secure();
  //       return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  //     }
  //
  //     String sha256ofString(String input) {
  //       final bytes = utf8.encode(input);
  //       final digest = sha256.convert(bytes);
  //       return digest.toString();
  //     }
  //
  //     final rawNonce = generateNonce();
  //     final nonce = sha256ofString(rawNonce);
  //
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //       nonce: nonce,
  //     );
  //     final oauthCredential = OAuthProvider("apple.com").credential(
  //       idToken: appleCredential.identityToken,
  //       rawNonce: rawNonce,
  //     );
  //     var fullname = "${appleCredential.givenName.toString().trim()} ${appleCredential.familyName.toString().trim()}";
  //
  //     await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  //     apiSignUp(
  //       firebaseToken: FirebaseAuth.instance.currentUser!.uid,
  //       signUpType: "Social_media",
  //       email: FirebaseAuth.instance.currentUser!.email,
  //       name: appleCredential.givenName != null ? fullname : FirebaseAuth.instance.currentUser!.displayName,
  //     );
  //   } catch (error, stackTrace) {
  //     SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
  //     hideLoading();
  //   }
  // }
  //
  // Future googleSignUPPasswordLess() async {
  //   showLoading();
  //   try {
  //     final googleSignIn = GoogleSignIn();
  //
  //     final googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) return;
  //     final googleAuth = await googleUser.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     final authResult = await FirebaseAuth.instance.signInWithCredential(credential);
  //     final firebaseProfilePicUrl = authResult.user!.photoURL.toString().trim();
  //     apiSignUp(
  //       firebaseToken: FirebaseAuth.instance.currentUser!.uid,
  //       signUpType: "Social_media",
  //       email: FirebaseAuth.instance.currentUser!.email,
  //       firebaseProfilePicUrl: firebaseProfilePicUrl,
  //       name: FirebaseAuth.instance.currentUser!.displayName,
  //     );
  //   } catch (error, stackTrace) {
  //     SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
  //     hideLoading();
  //   }
  // }

  Future<String> apiSignUp(
      {String? signUpType,
      String? firebaseProfilePicUrl,
      String? firebaseToken,
      String? password,
      String? email,
      String? name}) async {
    // await Get.find<TokenServices>().getAuthTokenFromFirebase();
    // // List<String> nameList = StringManipulation.nameSplit(fullname: name ?? firstNameController.text.trim());
    // Get.find<TokenServices>().careGiverFirstName = firstNameController.text.trim();
    // Get.find<TokenServices>().careGiverLastName = lastNameController.text.trim();
    // Get.find<TokenServices>().userProfileUrlUniversal.value = firebaseProfilePicUrl ?? "";
    String res = "";

    try {
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(apiUrl: ApiEndpoints.signUpApiUrl, body: {
        "upcode": referralCode.trim().toLowerCase(),
        "device_info": await DeviceInfoServices.getDeviceInfo(),
        "device_channelid": DeviceInfoServices.getDeviceChannelId(),
        "email": email ?? emailController.text.trim().toLowerCase(),
        "username_type": "Email",
        "countryid": 101.toString(),
        if (signUpType != "Social_media") "password": password ?? passwordController.text,
        "first_name": firstNameController.text.trim(),
        "last_name": lastNameController.text.trim(),
        // if (!GetPlatform.isWeb) "device_token": await FirebaseMessaging.instance.getToken(),
        if (signUpType != null) "signup_type": signUpType,
        if (firebaseToken != null) "firebase_id": firebaseToken,
        // "languageid": selectedPreferredLanguageMapping.languageId.toString().trim()
      });

      buttonPressed.value = false;

      if (decoded == null) return res;

      if (decoded["response"] == "User created successfully") {
        showPrint(decoded["response"].toString());
        // Get.find<TokenServices>().caregiverFirstName = firstNameController.text.trim();
        // Get.find<TokenServices>().upIdTypeIDModel.value =
        //     UpIdTypeModel(upIdTypeID: decoded["upid_type"], showCareRecipientAssessmentScreens: decoded["loved_one_active"]);
        // Get.offAll(() => const ThankYouForCrateAccountScreen());
        // loginApiHit();
        // _apiSelectLanguage(preferredLanguageMapping: selectedPreferredLanguageMapping);

        Get.delete<SignupScreenServices>();
      }
    } catch (error, stackTrace) {
      showToast(
          center: true,
          TrKeys.pleaseContactAtSupportGiversHealth.name.tr,
          showToastInReleaseMode: true,
          iconAsset: "images/icons/infoRed.png",
          // toastBackGroundColor: kColorRedLight,
          duration: const Duration(seconds: 5));
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }

    hideLoading();
    return res;
  }
}

// Future<dynamic> _apiSelectLanguage({required PreferredLanguageMapping preferredLanguageMapping}) async {
//   try {
//     Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
//         apiUrl: ApiFile.selectLanguageUrl, body: {"languageid": preferredLanguageMapping.languageId.toString().trim()});
//     if (decoded == null) return;
//   } catch (error, stackTrace) {
//     SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
//   }
// }
