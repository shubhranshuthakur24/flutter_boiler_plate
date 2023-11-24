// import 'package:flutter/material.dart';
//
// class SelectLanauageWidget extends StatefulWidget {
//   const SelectLanauageWidget({super.key});
//
//   @override
//   State<SelectLanauageWidget> createState() => _SelectLanauageWidgetState();
// }
//
// class _SelectLanauageWidgetState extends State<SelectLanauageWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         alignment: Alignment.center,
//         menuItemStyleData: const MenuItemStyleData(
//           padding: EdgeInsets.symmetric(horizontal: 15),
//           // overlayColor: MaterialStateProperty.all<Color?>(
//           //   Colors.transparent, // Replace with your desired color
//           // ),
//         ),
//         dropdownStyleData: const DropdownStyleData(
//           width: 184,
//           direction: DropdownDirection.left,
//         ),
//         customButton: Row(
//           children: [
//             const Spacer(),
//             Image.asset(
//               "images/icons/translation.png",
//               width: 24,
//             ),
//             const SizedBox(
//               width: 7,
//             ),
//             Text(
//               selectedPreferredLanguageMapping.languageName,
//               style: kFontNotoSansS15W600Button1.copyWith(),
//             )
//           ],
//         ),
//         items: preferredLanguageList
//             .map((e) => DropdownMenuItem(
//                 enabled: e.languageId == 1,
//                 alignment: Alignment.topRight,
//                 value: e.languageId,
//                 onTap: () {
//                   setState(() {
//                     changeLanguageAndStoreInLocalDb(preferredLanguageMapping: e);
//                   });
//                 },
//                 child: Center(
//                   child: Opacity(
//                     opacity: e.languageId == 1 ? 1 : 0.5,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         selectedPreferredLanguageMapping.languageId == e.languageId
//                             ? Container(
//                                 width: 24,
//                                 height: 24,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: kColorBlueDark,
//                                 ),
//                                 child: const Icon(
//                                   Icons.check,
//                                   color: kColorWhite,
//                                   size: 15,
//                                 ),
//                               )
//                             : Container(
//                                 width: 24,
//                                 height: 24,
//                                 decoration: const ShapeDecoration(
//                                   color: Color(0xFFF9F9F9),
//                                   shape: OvalBorder(
//                                     side: BorderSide(width: 0.47, color: Color(0xFFE2E2E2)),
//                                   ),
//                                 ),
//                               ),
//                         const SizedBox(
//                           width: 9,
//                         ),
//                         Text(
//                           e.languageName,
//                           style: kFontNotoSansS15W400Para2.copyWith(
//                               color: selectedPreferredLanguageMapping.languageId == e.languageId ? kColorBlueDark : null,
//                               fontWeight: selectedPreferredLanguageMapping.languageId == e.languageId ? FontWeight.w500 : null),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )))
//             .toList(),
//         onChanged: (value) {},
//       ),
//     );
//   }
// }
