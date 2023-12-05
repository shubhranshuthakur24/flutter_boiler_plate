import 'package:get/get.dart';

import '../../profile/services/mixin_get_cg_profile.dart';

class MenuServices extends GetxController with MixinGetCgProfile {
  static bool isScreenCalledFromHomeScreen = false;

  @override
  onInit() {
    super.onInit();
    apiGetCgProfile();
    // apiGetCareGiverDetails();
  }

  static String ageCalculator(String dob) {
    String age = "";
    try {
      var dobSplit = dob.split("-");
      age = (DateTime.now().year.toInt() - int.parse(dobSplit.last)).toString();
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
    return age.toString();
  }
}
