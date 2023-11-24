import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/services/signup_screen_services.dart';
import 'package:get/get.dart';

class SignUpScreenButtonColorChageWhenAllRequiredFeildAreFilled extends GetxController {
  RxBool allFieldAllVerifeid = false.obs;
  final SignupScreenServices _signupScreenServices = Get.find();
  static String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExpPassword = RegExp(pattern);

  textFieldValidation() async {
    if (_signupScreenServices.firstNameController.text.trim().isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (!GetUtils.isEmail(_signupScreenServices.emailController.text.trim())) {
      if (_signupScreenServices.emailController.text.trim().isEmpty) {
        allFieldAllVerifeid.value = false;
      } else {
        allFieldAllVerifeid.value = false;
      }
    } else if (!GetUtils.isLengthGreaterThan(_signupScreenServices.passwordController.text.trim(), 7) ||
        !regExpPassword.hasMatch(_signupScreenServices.passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(_signupScreenServices.passwordController.text.trim(), 7))) {
        allFieldAllVerifeid.value = false;
      } else {
        allFieldAllVerifeid.value = false;
      }
    } else if (_signupScreenServices.confirmPasswordConfirmController.text.trim().isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (_signupScreenServices.passwordController.text == _signupScreenServices.confirmPasswordConfirmController.text) {
      allFieldAllVerifeid.value = true;
    } else {
      allFieldAllVerifeid.value = false;
    }
  }
}
