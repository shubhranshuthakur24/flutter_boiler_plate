import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../utils/device_related/device_identify.dart';
import '../side_menu.dart';


class SideBarPanel extends StatelessWidget {
  const SideBarPanel({Key? key, required this.child, this.showSideMenu = false, this.rightSideMargin = true}) : super(key: key);
  final Widget child;
  final bool showSideMenu;
  final bool rightSideMargin;

  @override
  Widget build(BuildContext context) {
    return showSideMenu
        ? Container(
            color: kColorWhite,
            child: Row(
              children: [
                if (showSideMenu)
                  if (kDeviceIsDesktop(context))
                    Container(
                      margin: const EdgeInsets.only(right: 0),
                      child: const SideMenu(),
                    ),
                (kDeviceIsDesktop(context) && rightSideMargin)
                    ? SizedBox(
                        width: 838,
                        child: buildContainer(),
                      )
                    : Expanded(child: buildContainer()),
              ],
            ),
          )
        : Container(

            // color: kColorWhite,
            child: Center(
              child: Container(
                color: kColorSteelGray,
                width: 450,
                child: child,
              ),
            ),
          );
  }

  Container buildContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(
                color: kColorGrayLight,
              ),
              left: BorderSide(color: kColorGrayLight))),
      child: Container(decoration:  BoxDecoration(color: kColorMaroonLight.withOpacity(0.35)), child: child),
    );
  }
}
