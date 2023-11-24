
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../styles/constants.dart';
// import '../../styles/font_size_related_function.dart';

class TokenServices extends GetxController {
  String? idToken;

  @override
  void onInit() {
    super.onInit();
    // changeFontSizeAccordingToDevice();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) showPrint("uniqueId: ${user.uid.toString()}");
    });
    FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      if (user != null) {
        idToken = await user.getIdToken();
      }
      if (user == null) idToken == null;
      showPrint(idToken.toString());
      showPrint("////////////////////////////");
    });
    // FlutterNativeSplash.remove();
  }
  Future<void>initializeIdToken()async {
    if(Get.find<TokenServices>().idToken == null){
      Get.find<TokenServices>().idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    }
  }
  Future<void> firebaseAuthSignOut() async {
    await FirebaseAuth.instance.signOut();
    showToast("user signed out");
  }
}
