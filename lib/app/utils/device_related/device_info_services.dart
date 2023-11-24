import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoServices {
  static String? getDeviceChannelId() {
    if (GetPlatform.isWeb) {
      return "3";
    } else if (GetPlatform.isAndroid) {
      return "2";
    } else if (GetPlatform.isIOS) {
      return "1";
    }
    return null;
  }

  static Future<String?> getDeviceInfo() async {
    Map<String, dynamic>? map;
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      map = deviceInfo.toMap();
      if (GetPlatform.isWeb) {
        map = _webBrowserMap(map);
      } else if (GetPlatform.isIOS) {
        map = _iosMobileMap(map);
      } else if (GetPlatform.isAndroid) {
        map = _androidMobileMap(map);
      }
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      map["app_version"] = "${packageInfo.version}+${packageInfo.buildNumber}";
      return map.toString();
    } catch (error) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      map = {"app_version": "${packageInfo.version}+${packageInfo.buildNumber}"};
      return map.toString();
    }
  }

  static Map<String, dynamic> _iosMobileMap(var map) {
    Map<String, dynamic> details = {};
    details['systemVersion'] = map['systemVersion'];
    details['systemName'] = map['systemName'];
    details['model'] = map['model'];
    details['name'] = map['name'];
    return details;
  }

  static Map<String, dynamic> _androidMobileMap(var map) {
    Map<String, dynamic> details = {};
    details['manufacturer'] = map['manufacturer'];
    details['model'] = map['model'];
    details['version'] = map['version']['sdkInt'];
    details['versionRelease'] = map['version']['release'];
    return details;
  }

  static Map<String, dynamic> _webBrowserMap(var map) {
    Map<String, dynamic> details = {};
    details['browserName'] = map['browserName'];
    details['appCodeName'] = map['appCodeName'];
    details['appName'] = map['appName'];
    details['appVersion'] = map['appVersion'];
    details['deviceMemory'] = map['deviceMemory'];
    details['platform'] = map['platform'];
    details['product'] = map['product'];
    details['vendor'] = map['vendor'];
    return details;
  }
}
