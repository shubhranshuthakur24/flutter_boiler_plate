// import 'package:flutter/material.dart';
// import 'package:givershealths/app/styles/colors.dart';
// import 'package:givershealths/app/styles/constants.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//
// import '../../../../../styles/constant_font_size.dart';
// import '../../../../../styles/k_icons.dart';
//
// class GoogleButtonWidget extends StatelessWidget {
//   const GoogleButtonWidget({Key? key, required this.buttonName, required this.voidCallback}) : super(key: key);
//   final String buttonName;
//   final VoidCallback voidCallback;
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
//             fontSize: kFontSize18,
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         customInkWell(
//           onTap: (buttonName == "Log in with Apple" || buttonName == "Sign up with apple") ? () {} : voidCallback,
//           child: Container(
//             height: 35,
//             // width: 324,
//             decoration: (buttonName == "Log in with Apple" || buttonName == "Sign up with apple")
//                 ? const BoxDecoration()
//                 : BoxDecoration(border: Border.all(color: kColorBlueDark), borderRadius: BorderRadius.circular(kBorderRadius)),
//             child: (buttonName == "Log in with Apple" || buttonName == "Sign up with apple")
//                 ? SignInWithAppleButton(
//                     onPressed: voidCallback,
//                     style: SignInWithAppleButtonStyle.whiteOutlined,
//                   )
//                 : Row(
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
//                         buttonName,
//                         style: kButtonTextStyle1(buttonColor: kColorBlueDark),
//                       )
//                     ],
//                   ),
//           ),
//         )
//       ],
//     );
//   }
// }
