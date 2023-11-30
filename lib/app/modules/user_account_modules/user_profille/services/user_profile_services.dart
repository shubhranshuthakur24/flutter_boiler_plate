
import 'package:get/get.dart';


import '../../cg_profile_modules/profile/services/mixin_get_cg_profile.dart';

class ProfileScreenServices extends GetxController with MixinGetCgProfile{
  @override
  onInit() {
    super.onInit();
    apiGetCgProfile();
    // apiGetCgProfile();
    // apiGetCareGiverDetails();
  }

}