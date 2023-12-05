import 'package:get/get.dart';

mixin GlobalVariable {
  late String userId;
  late String userFirstName;
  late String userLastName;
  late String deviceTokenForNotification;
  RxString userProfileUrlUniversal = "".obs;
}
