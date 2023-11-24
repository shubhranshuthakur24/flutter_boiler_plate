import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../styles/constants.dart';
import '../../styles/webView.dart';
import '../device_related/device_identify.dart';


abstract class UrlLauncher {
  static launchURL(String websiteUrl, {bool openInBrowser = true}) async {
    String url = websiteUrl;
    if (!(websiteUrl.toLowerCase().startsWith("http"))) {
      url = "https://$websiteUrl";
    }
    if (kDeviceIsWeb() || openInBrowser) {
      if (await canLaunch(Uri.encodeFull(url))) {
        showPrint(url.toString());
        await launch(Uri.encodeFull(url));
      } else {
        throw 'Could not launch ';
      }
    } else {
      Get.to(() => WebViews(url: url), transition: Transition.noTransition);
    }
  }

  static phoneNumberLaunch(String phoneNumber) async {
    var url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static emailLauncher(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }
}
