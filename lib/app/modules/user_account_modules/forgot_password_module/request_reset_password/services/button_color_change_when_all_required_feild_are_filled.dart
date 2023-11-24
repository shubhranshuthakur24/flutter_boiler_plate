import 'package:flutter_boiler_plate/app/modules/user_account_modules/forgot_password_module/request_reset_password/services/request_reset_password_services.dart';
import 'package:get/get.dart';

class RequestResetPaswordScreenButtonColorChageWhenAllRequiredFeildAreFilled extends GetxController {
  RxBool allFieldAllVerifeid = false.obs;
  final RequestResetPasswordServices _requestResetPasswordServices = Get.find();

  textFieldValidation() {
    if (_requestResetPasswordServices.emailController.text.toString().isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (!GetUtils.isEmail(_requestResetPasswordServices.emailController.text.trim())) {
      allFieldAllVerifeid.value = false;
    } else {
      allFieldAllVerifeid.value = true;
    }
  }
}
