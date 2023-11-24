import 'package:get/get.dart';

import 'otp_services.dart';

class OtpScreenButtonColorChageWhenAllRequiredFeildAreFilled extends GetxController {
  RxBool allFieldAllVerifeid = false.obs;

  textFieldValidation() async {
    OtpScreenServices otpScreenServices = Get.find();
    otpScreenServices.otpText = otpScreenServices.firstDigitOtp.text +
        otpScreenServices.secondDigitOtp.text +
        otpScreenServices.thirdOtp.text +
        otpScreenServices.fourthDigitOtp.text +
        otpScreenServices.fifthDigitOtp.text +
        otpScreenServices.sixthDigitOtp.text;
    if (otpScreenServices.otpText.length == 6) {
      allFieldAllVerifeid.value = true;
    } else {
      allFieldAllVerifeid.value = false;
    }
  }
}
