// import 'package:flutter/material.dart';  import 'package:get/get.dart'; import 'package:givershealths/SRC/internationalization_using_getx/tr_keys.dart';
// import 'package:givershealths/SRC/url_launcher/url_launcher.dart';
// import 'package:givershealths/a_constant/constants.dart';
// import 'package:givershealths/a_constant/style/colors.dart';
// import 'package:givershealths/app/modules/user_account_modules/sign_in/widget/sign_in_screen_bottom_text_widget.dart';
//
// import '../../../../../a_constant/k_icons.dart';
//
// SigUpScreenBottomTextWidget() {
//   return Wrap(children: [
//     Text(
//       tKeyName.byLoggingInYouAgreeTo.name.tr,
//       style:
//           TextStyle(fontFamily: constantOpenSans, fontWeight: FontWeight.w300, fontSize: TextSize.toDouble(), color: kColorBlack),
//     ),
//     customInkWell(
//       onTap: () {
//         UrlLauncher.launchURL(openInBrowser: true, "https://givers.health/terms-of-service");
//       },
//       child: Text(
//         "Terms of Service ",
//         style: TextStyle(
//           color: kColorBlueDark,
//           fontWeight: FontWeight.w300,
//           fontSize: TextSize.toDouble(),
//         ),
//       ),
//     ),
//     Text(
//       "and ",
//       style:
//           TextStyle(fontFamily: constantOpenSans, fontWeight: FontWeight.w300, fontSize: TextSize.toDouble(), color: kColorBlack),
//     ),
//     customInkWell(
//       onTap: () {
//         UrlLauncher.launchURL(openInBrowser: true, "https://givers.health/privacy-policy");
//       },
//       child: const TermsOfUseTextColored(
//         text: " Privacy Policy.",
//       ),
//     )
//   ]);
// }
//
// class OnHoverText extends StatefulWidget {
//   final Widget child;
//
//   const OnHoverText({Key? key, required this.child}) : super(key: key);
//
//   @override
//   _OnHoverTextState createState() => _OnHoverTextState();
// }
//
// class _OnHoverTextState extends State<OnHoverText> {
//   bool isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final hoveredTransform = Matrix4.identity()..scale(1.5);
//     final transform = isHovered ? hoveredTransform : Matrix4.identity();
//     return SizedBox(
//       height: size.height * 0.01,
//       child: MouseRegion(
//         onEnter: (event) => onEntered(true),
//         onExit: (event) => onEntered(false),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           transform: transform,
//           child: widget.child,
//         ),
//       ),
//     );
//   }
//
//   void onEntered(bool isHovered) => setState(() {
//         this.isHovered = isHovered;
//       });
// }
