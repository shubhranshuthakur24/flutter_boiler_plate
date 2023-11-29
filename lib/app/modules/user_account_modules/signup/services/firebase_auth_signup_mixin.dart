// import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/services/signup_screen_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../routes/screen_names.dart';
// import '../../../../styles/constants.dart';
// import '../../../../utils/internationalization_using_getx/tr_keys.dart';
//
// mixin FirebaseAuthSignUpWithEmailAndPasswordMixin {
//   Future<void> firebaseSignUpWithEmailAndPassword() async {
//     SignupScreenServices signupScreenServices = Get.find();
//
//     try {
//       var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: signupScreenServices.emailController.text.trim(),
//           password: signupScreenServices.passwordController.text.trim());
//
//       if (result.user != null) {
//         // User registration successful
//         signupScreenServices.buttonPressed.value = true;
//         showPrint(result.toString());
//         showPrint("line 24");
//         // apiSignUp(
//         //       firebaseToken: FirebaseAuth.instance.currentUser!.uid,
//         //       signUpType: "Social_media",
//         //       email: FirebaseAuth.instance.currentUser!.email,
//         //       firebaseProfilePicUrl: "",
//         //       name: FirebaseAuth.instance.currentUser!.displayName,
//         //     );
//         Get.toNamed(ScreenNames.home.routeName);
//       } else {
//         // Handle the case when result.user is null
//         throw Exception("User registration failed.");
//       }
//     } on FirebaseAuthException catch (e) {
//       String er;
//       if (e.code == 'weak-password') {
//         er = TrKeys.thePasswordProvidedIsTooWeak.name.tr;
//         showPrint("line 28");
//       } else if (e.code == 'email-already-in-use') {
//         er = 'The account already exists for that email. Please login instead';
//         showPrint("line 38");
//       } else {
//         er = e.message!; // Use the error message for other cases
//         showPrint(e.code.toString());
//         showPrint("line 40");
//       }
//       signupScreenServices.buttonPressed.value = false;
//       showPrint("line 42");
//     } catch (e, stackTrace) {
//       String er = e.toString();
//       showPrint(er);
//       showErrorDialog(er); // Display an error dialog
//     }
//   }
//
//
// }
