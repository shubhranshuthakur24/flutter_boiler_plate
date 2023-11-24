// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter_boiler_plate/app/modules/user_account_modules/sign_in/services/sign_in_screen_services.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// import '../../../../styles/constants.dart';
//
// mixin MixinAppleSignIn {
//   void appleSignPasswordLess() async {
//     SignInScreenServices signInScreenServices = Get.find();
//     showLoading();
//     try {
//       String generateNonce([int length = 32]) {
//         const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//         final random = Random.secure();
//         return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
//       }
//
//       String sha256ofString(String input) {
//         final bytes = utf8.encode(input);
//         final digest = sha256.convert(bytes);
//         return digest.toString();
//       }
//
//       final rawNonce = generateNonce();
//       final nonce = sha256ofString(rawNonce);
//
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//         nonce: nonce,
//       );
//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: appleCredential.identityToken,
//         accessToken: appleCredential.authorizationCode,
//         rawNonce: rawNonce,
//       );
//       showPrint(oauthCredential.asMap().toString());
//       showPrint(AppleIDAuthorizationScopes.email.toString());
//       var firebaseProviderData = FirebaseAuth.instance.currentUser?.providerData;
//       var user = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
//       var tempUser = FirebaseAuth.instance;
//
//       var fullname = "${appleCredential.givenName.toString().trim()} ${appleCredential.familyName.toString().trim()}";
//
//       if (appleCredential.givenName != null) {
//         tempUser.currentUser!.updateDisplayName(fullname);
//       }
//       signInScreenServices.apiLogin(
//           email: FirebaseAuth.instance.currentUser!.email.toString(),
//           firebaseId: FirebaseAuth.instance.currentUser!.uid.toString(),
//           signInType: "Social_media");
//       // Get.delete<SignInScreenServices>();
//       await Get.find<TokenServices>().getAuthTokenFromFirebase();
//
//       //Get.offAllNamed(ScreenNameEnums.home.routeName);
//     } catch (error, stackTrace) {
//       SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
//       hideLoading();
//     }
//   }
// }
