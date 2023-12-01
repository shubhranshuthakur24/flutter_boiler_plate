import 'package:get/get.dart';

mixin GlobalVariable {
  late int userId;
  late String userFirstName;
  late String userLastName;
  late String deviceTokenForNotification;
  RxString userProfileUrlUniversal = "".obs;
}
