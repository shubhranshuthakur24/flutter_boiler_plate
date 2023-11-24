import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../styles/colors.dart';
import '../../styles/constants.dart';
import '../../styles/font_styles.dart';
import '../../styles/k_icons.dart';
import '../../utils/internationalization_using_getx/tr_keys.dart';

enum availableApiName { UpdateLovedOneDetils, UpdateUserdetils, SaveAssessment, isYourLovedOneDiagnosedWithAnyDiseasse }

class ExitBackAndNextButtonsList extends StatelessWidget {
  availableApiName apiName;

  // bool showExitButton;
  Color dynamicColor;

  ExitBackAndNextButtonsList({super.key, required this.apiName, required this.next, this.dynamicColor = kColorBlueDark});

  final VoidCallback next;
  RxBool buttonPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const SizedBox(width: 24),
          Expanded(
            child: customInkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(36), border: Border.all(width: 1, color: kColorBlueDark)),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.back,
                      size: 18,
                      color: kColorBlueDark,
                    ),
                    Text(
                      TrKeys.back.name.tr,
                      style: kFontNotoSansS18W400Para1.copyWith(color: kColorBlueDark),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: customInkWell(
              onTap: () {
                next();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: dynamicColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      TrKeys.next.name.tr,
                      style: kFontNotoSansS18W400Para1.copyWith(color: kColorWhite),
                    ),
                    const Icon(
                      CupertinoIcons.forward,
                      size: 18,
                      color: kColorWhite,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
