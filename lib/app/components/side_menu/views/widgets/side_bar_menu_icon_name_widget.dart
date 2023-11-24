import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/screen_names.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/font_styles.dart';


class SideBarMenuIconNameWidget extends StatelessWidget {
  final List<ScreenNames> selectedSideBar;
  final String ? unSelectedIcon;
  final String ? selectedIcon;
  final String menuName;
  final bool isHovered;
  final bool isIconAvailable;

  const SideBarMenuIconNameWidget({
    super.key,
    required this.selectedSideBar,
     this.unSelectedIcon,
    required this.menuName,
    required this.isHovered,
    required this.isIconAvailable,
     this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(isIconAvailable)Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8, top: 5, bottom: 5),
              child: Image.asset(
                "images/icons/${_bool() ? selectedIcon : unSelectedIcon}",
                height: 25,
                width: 25,
              ),
            ),
            // if (selectedSideBar.firstWhereOrNull((element) => element == ScreenNames.chat) != null)
            //   Obx(() {
            //     return (Get.find<TokenServices>().isNewMessageFromGroup.value)
            //         ? const Positioned(
            //             top: 1,
            //             right: 0,
            //             child: Icon(
            //               Icons.circle,
            //               color: Colors.red,
            //               size: 12,
            //             ),
            //           )
            //         : const SizedBox.shrink();
            //   }),
          ],
        ),
        const SizedBox(
          width: 0,
        ),
        Text(menuName,
            style: kFontPoppins.copyWith(
              fontSize: 18,
              fontWeight: _bool() ? FontWeight.w600 : FontWeight.w400,
              color: _bool() ? kColorMaroon : kColorBlack,
            )

            // TextStyle(
            //   fontSize: kFontSize18.toDouble(),
            //   color:   (selectedSideBar.firstWhereOrNull((element) => element.name == Get.currentRoute) != null) ? kColorBlueDark : kColorBlack,
            // ),
            )
      ],
    );
  }

  bool _bool() {
    return (selectedSideBar.firstWhereOrNull((element) => element.routeName == Get.currentRoute.split("?")[0]) != null);
  }
}
