import 'package:get/get.dart';

import '../../../modules/user_account_modules/signup/services/firebase_auth_signIn_mixin.dart';
import '../../../routes/screen_names.dart';

class SideBarMenuServices extends GetxController  {
  final Rx<ScreenNames> selectedScreenNameEnums = ScreenNames.home.obs;
}
