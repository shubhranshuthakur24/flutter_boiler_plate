import 'package:flutter_boiler_plate/app/utils/device_related/device_identify.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void configureApp() {
  if(kDeviceIsWeb()){
    setUrlStrategy(PathUrlStrategy());
    WebViewPlatform.instance = WebWebViewPlatform();
  }
return;
}
