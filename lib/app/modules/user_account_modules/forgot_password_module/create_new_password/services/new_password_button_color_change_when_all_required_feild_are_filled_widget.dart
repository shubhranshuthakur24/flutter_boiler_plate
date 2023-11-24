import 'package:flutter_boiler_plate/app/modules/user_account_modules/forgot_password_module/create_new_password/services/reset_password_screen_services.dart';
import 'package:get/get.dart';

class NewPasswordScreenButtonColorChageWhenAllRequiredFeildAreFilled extends GetxController {
  static String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExpPassword = RegExp(pattern);
  RxBool allFieldAllVerifeid = false.obs;
  final ResetPasswordScreenServices _resetPasswordScreenServices = Get.find();

  textFieldValidation() async {
    if (!GetUtils.isLengthGreaterThan(_resetPasswordScreenServices.passwordController.text.trim(), 7) ||
        !regExpPassword.hasMatch(_resetPasswordScreenServices.passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(_resetPasswordScreenServices.passwordController.text.trim(), 7))) {
        allFieldAllVerifeid.value = false;
      } else {
        allFieldAllVerifeid.value = false;
      }
    } else if (_resetPasswordScreenServices.confirmPasswordController.text.isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (_resetPasswordScreenServices.passwordController.text ==
        _resetPasswordScreenServices.confirmPasswordController.text) {
      allFieldAllVerifeid.value = true;
    } else {
      allFieldAllVerifeid.value = false;
    }
  }
}
