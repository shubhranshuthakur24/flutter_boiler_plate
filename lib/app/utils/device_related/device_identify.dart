import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool kDeviceIsAndroidOrIos() {
  return (kDeviceIsAndroid() || kDeviceIsIos());
}

bool kDeviceIsWeb() {
  return (GetPlatform.isWeb);
}

bool kDeviceIsAndroid() {
  return (GetPlatform.isAndroid);
}

bool kDeviceIsIos() {
  // return (GetPlatform.isIOS || GetPlatform.isMacOS);
  return (GetPlatform.isIOS);
}

bool kDeviceIsDesktop(BuildContext context) {
  bool a = MediaQuery.of(context).size.width > 1126 ? true : false;
  return a;
}

bool kDevicesIsMobile(BuildContext context) {
  return !kDeviceIsDesktop(context);
}

bool kDevicesIsTab(BuildContext context) {
  return (MediaQuery.of(context).size.width > 600 && MediaQuery.of(context).size.width < 1116);
}

bool kDevicesIsMobileWeb() {
  return (GetPlatform.isMobile && GetPlatform.isWeb);
}
