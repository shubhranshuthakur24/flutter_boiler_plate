import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/constant_font_size.dart';
import '../../styles/k_icons.dart';


customAppBarNotificationPage({
  IconData? rightSideIcon,
  required String appBarTitle,
  var onTapRightSideIcon,
  IconData? leftSideIcon,
  var onTapLeftSideIcon,
}) {
  return AppBar(
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
      child: textWidget(appBarTitle),
    ),
    backgroundColor: kColorSteelGray,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: customInkWell(
        onTap: onTapLeftSideIcon,
        child: Icon(
          leftSideIcon,
          color: kColorBlack,
          size: 22.0,
        ),
      ),
    ),
    actions: [
      if (rightSideIcon != null)
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: customInkWell(
            onTap: onTapRightSideIcon,
            child: Icon(
              rightSideIcon,
              color: kColorBlack,
              size: 22.0,
            ),
          ),
        )
    ],
    elevation: 0.4,
  );
}

Text textWidget(String appBarTitle) {
  return Text(
    appBarTitle,
    style: TextStyle(
      color: kColorBlack,
      fontSize: kFontSize20,
      decoration: TextDecoration.none,
    ),
  );
}
