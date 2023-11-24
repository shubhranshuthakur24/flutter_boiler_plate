// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:givershealths/app/modules/user_account_modules/sign_in/services/sign_in_screen_services.dart';
// import 'package:givershealths/app/styles/colors.dart';
// import 'package:givershealths/app/styles/constants.dart';
// import 'package:givershealths/app/utils/internationalization_using_getx/tr_keys.dart';
// import 'package:givershealths/app/utils/sentry_and_error_related/sentry_function.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// mixin MixinGoogleSignInPasswordLess {
//   void googleSignPasswordLess() async {
//     SignInScreenServices signInScreenServices = Get.find();
//     showLoading();
//     try {
//       final googleSignIn = GoogleSignIn();
//       await googleSignIn.signOut();
//       final googleUser = await googleSignIn.signIn();
//       List<String> data2 = await FirebaseAuth.instance.fetchSignInMethodsForEmail(googleUser!.email.toString());
//       if (data2.isEmpty) {
//         hideLoading();
//         showToast(
//             center: true,
//             TrKeys.sorryWeDontRecognizeThatEmailOrPasswordYouCanTryAgainOrResetYourPassword.name.tr,
//             showToastInReleaseMode: true,
//             toastBackGroundColor: kColorRedLight,
//             iconAsset: "images/icons/infoRed.png",
//             duration: const Duration(seconds: 5));
//         return;
//       }
//
//       // return;
//       if (googleUser == null) return;
//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//
//       signInScreenServices.apiLogin(
//           email: FirebaseAuth.instance.currentUser!.email.toString(),
//           firebaseId: FirebaseAuth.instance.currentUser!.uid.toString(),
//           signInType: "Social_media");
//     } catch (error, stackTrace) {
//       SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
//       hideLoading();
//     }
//   }
//
//   void googleSignInWithEmailAndPassword({required String email, required String password}) async {
//     String er = "";
//     SignInScreenServices signInScreenServices = Get.find();
//     try {
//       var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//       signInScreenServices.apiLogin(email: email, password: password, firebaseId: result.user!.uid);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         er = TrKeys.sorryWeDontRecognizeThatEmailOrPasswordYouCanTryAgainOrResetYourPassword.name.tr;
//       } else if (e.code == "wrong-password") {
//         er = TrKeys.thatsNotTheRightPasswordTryAgain.name.tr;
//       } else {
//         er = e.code;
//       }
//       showToast(
//           center: true,
//           er.toString(),
//           showToastInReleaseMode: true,
//           toastBackGroundColor: kColorRedLight,
//           iconAsset: "images/icons/infoRed.png",
//           duration: const Duration(seconds: 5));
//       signInScreenServices.signInButtonPressed.value = false;
//     } catch (e) {
//       er = e.toString();
//       signInScreenServices.signInButtonPressed.value = false;
//     }
//   }
// }
