
import 'package:get/get.dart';

import '../../profile_modules/profile/services/mixin_get_cg_profile.dart';


class ProfileScreenServices extends GetxController with MixinGetCgProfile {
  @override
  onInit() async {
    super.onInit();
    // Call the API to get user data

    await apiGetCgProfile();
    // var usermodel=userScreenModel.value


  }


}
