import 'package:flutter/cupertino.dart';
import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/services/signup_screen_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../helpers/token_services/token_services.dart';
import '../../../../routes/screen_names.dart';
import '../../../../styles/constants.dart';

mixin SignUpApiMixin {
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
  String? firstNameStringReturn() {
    if (firstNameController.text.trim().isEmpty) {
      return"firstNameCantBeEmpty";
    }
    return null;
  }

  String? lastNameStringReturn() {
    if (lastNameController.text.trim().isEmpty) {
      return "";
    }
    return null;
  }

  String? emailStringReturn() {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
        return "Email Can' t Be Empty";
      } else {
        return "Please Enter Valid Email";
      }
    }
    return null;
  }

  String? passwordStringReturn() {
    if (!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7) ||
        !regExpPassword.hasMatch(passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7))) {
        return "Password Minimum Length Should Be Eight Character";
      } else {
        return "Password Must Contains One Upper Case One Lower Case One Numerical And One Special Character";
      }
    }
    return null;
  }

  String? confirmPasswordStringReturn() {
    if (confirmPasswordConfirmController.text.trim().isEmpty) {
      return "Confirm Password Can't Be Empty";
    } else if (confirmPasswordConfirmController.text.trim() != passwordController.text.trim()) {
      return "Password And ConfirmPassword Are Not Same";
    }
    return null;
  }

  ///Text Form Field Validator

  Future<String> apiSignUp(
      {
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
        "email": email ?? emailController.text.trim().toLowerCase(),
        "first_name": firstNameController.text.trim(),
        "last_name": lastNameController.text.trim(),
        if (firebaseToken != null) "firebase_id": firebaseToken,
      });
      showPrint(decoded.toString());
      buttonPressed.value = false;

      if (decoded == null) {
        // Handle the case when decoding is unsuccessful
        return res;
      }

      if (decoded["status"] == "success") {
        showToast(center: true, "Account created successfully !!", showToastInReleaseMode: true);
        if (decoded["data"] != null ) {
          showPrint(decoded["data"]["userid"].toString());
          Get.find<TokenServices>().userFirstName = firstNameController.text.trim();
          Get.find<TokenServices>().userLastName = lastNameController.text.trim();
          Get.toNamed(ScreenNames.home.routeName);
          Get.delete<SignupScreenServices>();
        } else {
          // Handle the case when the "data" or "userid" key is not present in the response
          showPrint("Invalid response format");
          // Additional error handling or user feedback can be added here
        }
      } else {
        // Handle the case when the status is not "success"
        showPrint("Account creation failed: ${decoded["status"]}");
        // Additional error handling or user feedback can be added here
      }
  } catch (error, stackTrace) {
      showToast(
          center: true,
          "Please Contact Support!",
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