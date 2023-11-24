import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/constants.dart';
import '../../styles/font_styles.dart';
import '../../styles/k_icons.dart';

class kButtonPrimaryStyle extends StatelessWidget {
  kButtonPrimaryStyle({
    Key? key,
    this.buttonName = "Save",
    this.dynamicColor = kColorBlueDark,
    required this.onButtonTab,
    this.marginOnLeft = false,
    this.marginOnRight = false,
    this.showLoading = false,
  }) : super(key: key);
  String buttonName;
  VoidCallback onButtonTab;
  bool marginOnLeft;
  bool marginOnRight;
  bool showLoading;
  Color dynamicColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginOnLeft ? 20 : 0, right: marginOnRight ? 20 : 0),
      child: showLoading
          ? showSpinkitRing(color: kColorMaroon)
          : customInkWell(
              onTap: onButtonTab,
              child: Container(
                decoration: BoxDecoration(color: dynamicColor, borderRadius: BorderRadius.circular(kBorderRadius)),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                child: Center(
                  child: Text(
                    buttonName,
                    style: kFontNotoSansS13W600Button2.copyWith(color: kColorWhite),
                  ),
                ),
              ),
            ),
    );
  }
}
