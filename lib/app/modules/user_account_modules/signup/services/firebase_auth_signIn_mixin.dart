import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/constants.dart';
import '../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../sign_in/services/sign_in_screen_services.dart';

mixin FirebaseAuthSignInWithEmailAndPasswordMixin {
  void firebaseAuthSignInWithEmailAndPassword({required String email, required String password}) async {
    String er = "";
    SignInScreenServices signInScreenServices = Get.find();
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      signInScreenServices.apiLogin(email: email, password: password, firebaseId: result.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        er = TrKeys.sorryWeDontRecognizeThatEmailOrPasswordYouCanTryAgainOrResetYourPassword.name.tr;
      } else if (e.code == "wrong-password") {
        er = TrKeys.thatsNotTheRightPasswordTryAgain.name.tr;
      } else {
        er = e.code;
      }
      showToast(
          center: true,
          er.toString(),
          showToastInReleaseMode: true,
          toastBackGroundColor: kColorRedLight,
          iconAsset: "images/icons/infoRed.png",
          duration: const Duration(seconds: 5));
      signInScreenServices.signInButtonPressed.value = false;
    } catch (e) {
      er = e.toString();
      signInScreenServices.signInButtonPressed.value = false;
    }
  }
}

mixin FirebaseAuthSignOutWithEmailAndPasswordMixin {
  final RxBool isSignOutSuccess = false.obs;

  Future<void> firebaseAuthSignOut() async {
    await FirebaseAuth.instance.signOut().then((value){isSignOutSuccess.value = true;});
  }
}