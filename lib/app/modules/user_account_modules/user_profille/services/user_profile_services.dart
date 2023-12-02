
import 'package:get/get.dart';


import '../../cg_profile_modules/profile/services/mixin_get_cg_profile.dart';
class ProfileScreenServices extends GetxController with MixinGetCgProfile {
  @override
  onInit() {
    super.onInit();
    // Call the API to get user data
    apiGetCgProfile();
    // var usermodel=userScreenModel.value


  }


}
