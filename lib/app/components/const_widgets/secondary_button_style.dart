import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/colors.dart';
import '../../styles/constants.dart';
import '../../styles/font_styles.dart';
import '../../styles/k_icons.dart';
import '../../utils/internationalization_using_getx/tr_keys.dart';

class kButtonSecondaryStyle extends StatelessWidget {
  kButtonSecondaryStyle(
      {Key? key,
      this.buttonName,
      required this.onButtonTab,
      this.marginOnLeft = false,
      this.marginOnRight = false,
      this.showLoading = false})
      : super(key: key);

  String? buttonName;
  VoidCallback onButtonTab;
  bool marginOnLeft;
  bool marginOnRight;
  bool showLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginOnLeft ? 20 : 0, right: marginOnRight ? 20 : 0),
      child: showLoading
          ? showSpinkitRing(color: kColorBlueDark)
          : customInkWell(
              onTap: onButtonTab,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius)),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(buttonName ?? TrKeys.cancel.name.tr, style: kFontNotoSansS13W600Button2),
              ),
            ),
    );
  }
}
