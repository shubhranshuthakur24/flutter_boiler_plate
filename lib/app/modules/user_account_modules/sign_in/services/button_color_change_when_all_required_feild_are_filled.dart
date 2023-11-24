import 'package:flutter_boiler_plate/app/modules/user_account_modules/sign_in/services/sign_in_screen_services.dart';
import 'package:get/get.dart';

class SignInScreenButtonColorChageWhenAllRequiredFeildAreFilled extends GetxController {
  RxBool allFieldAllVerified = false.obs;
  final SignInScreenServices _signInScreenServices = Get.find();

  textFieldValidation() async {
    if (!GetUtils.isEmail(_signInScreenServices.emailController.text.trim())) {
      if (_signInScreenServices.emailController.text.trim().isEmpty) {
        allFieldAllVerified.value = false;
      } else {
        allFieldAllVerified.value = false;
      }
    } else if (_signInScreenServices.passwordController.text.isEmpty) {
      allFieldAllVerified.value = false;
    } else {
      allFieldAllVerified.value = true;
    }
  }
}
