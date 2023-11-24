// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_utils/src/platform/platform.dart';
// import 'package:givershealths/app/styles/colors.dart';
// import 'package:givershealths/app/styles/constants.dart';
//
// import '../../../../../styles/k_icons.dart';
// import '../../../sign_in/services/auth_service.dart';
//
// class AppleButtonWidget extends StatelessWidget {
//   const AppleButtonWidget({Key? key, this.buttonName, this.voidCallback}) : super(key: key);
//   final String? buttonName;
//   final VoidCallback? voidCallback;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           "OR",
//           style: TextStyle(
//             fontFamily: constantOpenSans,
//             color: kColorBlack,
//             fontWeight: FontWeight.w600,
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         customInkWell(
//           onTap: () {
//             _signInWithApple(context);
//           },
//           child: Container(
//             height: 50,
//             decoration: BoxDecoration(border: Border.all(color: kColorBlueDark), borderRadius: BorderRadius.circular(6)),
//             child: (GetPlatform.isIOS)
//                 ? Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(
//                         kIconGoogle,
//                         color: kColorBlueDark,
//                         size: 20,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "Sign in with Apple",
//                         style: kButtonTextStyle1(buttonColor: kColorBlueDark),
//                       )
//                     ],
//                   )
//                 : Container(),
//           ),
//         )
//       ],
//     );
//   }
// }
//
// Future<void> _signInWithApple(BuildContext context) async {
//   try {
//     final authService = AuthService();
//     final user = await authService.signInWithApple();
//   } catch (e) {}
// }
