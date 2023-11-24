// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// mixin SignUpWithGoogleServicesMixin {
//   Future<dynamic> googleSignUpWithEmailAndPassword() async {
//     // SignupScreenServices signupScreenServices = Get.find();
//     String er = "";
//
//     try {
//       var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: signupScreenServices.emailController.text.trim(), password: signupScreenServices.passwordController.text.trim());
//       signupScreenServices.buttonPressed.value = true;
//       signupScreenServices.apiSignUp(
//           firebaseToken: FirebaseAuth.instance.currentUser!.uid,
//           signUpType: "Email",
//           email: FirebaseAuth.instance.currentUser!.email,
//           password: signupScreenServices.passwordController.text.trim());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         er = TrKeys.thePasswordProvidedIsTooWeak.name.tr;
//         showToast(
//             center: true,
//             er,
//             showToastInReleaseMode: true,
//             iconAsset: "images/icons/infoRed.png",
//             toastBackGroundColor: kColorRedLight,
//             duration: const Duration(seconds: 5));
//       } else if (e.code == 'email-already-in-use') {
//         er = 'The account already exists for that email. Please login instead';
//       } else {
//         er = e.code;
//       }
//       signupScreenServices.buttonPressed.value = false;
//       showToast(
//           center: true,
//           er,
//           showToastInReleaseMode: true,
//           iconAsset: "images/icons/infoRed.png",
//           toastBackGroundColor: kColorRedLight,
//           duration: const Duration(seconds: 5));
//     } catch (e, stackTrace) {
//       er = e.toString();
//
//       SentryFunction.captureErrorFromTryCatchBlock(error: e, stackTrace: stackTrace);
//     }
//   }
// }
