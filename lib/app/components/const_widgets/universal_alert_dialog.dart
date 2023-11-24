import 'package:flutter_boiler_plate/app/components/const_widgets/primary_button_style.dart';
import 'package:flutter_boiler_plate/app/components/const_widgets/secondary_button_style.dart';
import 'package:flutter_boiler_plate/app/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_sizes.dart';
import '../../utils/internationalization_using_getx/tr_keys.dart';

kAlertDialogPrimary(
    {required String title,
    String? rightSideButtonName,
    String? leftSideButtonName,
    required VoidCallback onTapRightSideIcon,
    required VoidCallback onTapLeftSideIcon,
    String secondaryTitle = ""}) {
  rightSideButtonName ??= TrKeys.confirm.name.tr;
  leftSideButtonName ??= TrKeys.cancel.name.tr;
  return showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kFontLatoS18W400,
          ),
          if (secondaryTitle.trim().isNotEmpty)
            Container(
              padding:const EdgeInsets.only(top: kGap10),
              child: Text(
                secondaryTitle,
                style: kFontLatoS18W400,
              ),
            ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              kButtonSecondaryStyle(onButtonTab: onTapLeftSideIcon, buttonName: leftSideButtonName),
              kButtonPrimaryStyle(
                marginOnLeft: true,
                onButtonTab: onTapRightSideIcon,
                buttonName: rightSideButtonName!,
              )
            ],
          )
        ],
      ),
    ),
  );
}
