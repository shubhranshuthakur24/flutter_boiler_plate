
import 'package:get/get.dart';

import 'mixin_get_cg_profile.dart';



class ProfileScreenServices extends GetxController with MixinGetCgProfile {
  @override
  onInit() async {
    super.onInit();
    await apiGetCgProfile();
  }


}
