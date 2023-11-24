import 'package:chat_app/app/modules/user_account_modules/referral_code/views/widgets/popup_for_calgrows_widget.dart';
import 'package:chat_app/app/modules/user_account_modules/referral_code/views/widgets/popup_screen_for_caregiver_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/const_widgets/universal_widgets.dart';
import '../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/constant_font_size.dart';
import '../../../../styles/constants.dart';
import '../../../../styles/font_styles.dart';
import '../../../../styles/k_icons.dart';
import '../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../sign_in/views/widgets/sign_in_screen_bottom_text_widget.dart';
import '../services/referral_code_services.dart';

class ReferralCodeScreen extends GetView<ReferralCodeServices> {
  const ReferralCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _goToSignInScreen();
        return false;
      },
      child: Scaffold(
        backgroundColor: kColorSteelGray,
        body: SideBarPanel(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 35),
              // height: kDevicesIsTab(context) ? null : 812,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customInkWell(
                        onTap: () {
                          _goToSignInScreen();
                        },
                        child: const Icon(
                          CupertinoIcons.back,
                          color: kColorBlack,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    kBuildForCalgrows
                        ? TrKeys.whatIsYourUniqueProgramIDCopyForCalgrows.name.tr
                        : TrKeys.whatIsYourUniqueProgramIDCopyforCaregiver.name.tr,
                    style: TextStyle(fontSize: kFontSize25, fontFamily: constantOpenSans, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFieldTittle(textFildTittle: TrKeys.UPID.name.tr),
                  Container(
                    // width: 327,
                    margin: const EdgeInsets.only(bottom: 9),
                    child: Form(
                      key: controller.formKey,
                      child: TextFormField(
                        style: const TextStyle(color: kBuildForCalgrows ? kColorGray : kColorBlack),
                        enabled: !kBuildForCalgrows,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return TrKeys.uniqueProgramIDCantBeEmpty.name.tr;
                          }
                          return null;
                        },
                        keyboardAppearance: Brightness.light,
                        onChanged: (value) {
                          controller.referralCode.value = value;
                        },
                        maxLength: 34,
                        controller: controller.referralEditingController,
                        showCursor: true,
                        cursorColor: kColorBlueDark,
                        textDirection: TextDirection.ltr,
                        autofocus: true,
                        decoration: InputDecoration(
                          errorMaxLines: 2,
                          hoverColor: kColorWhite,
                          border: InputBorder.none,
                          counterText: "",
                          filled: true,
                          fillColor: kColorWhite,
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kColorBlueDark, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Obx(() {
                    return controller.isVerificationButtonPressed.value == true
                        ? showSpinkitRing(color: kColorBlueDark)
                        : PurpleButton(
                            text: TrKeys.Continue.name.tr,
                            press: () {
                              controller.formKey.currentState?.validate();
                              if (controller.referralEditingController.text.trim().isEmpty) {
                                return;
                              }
                              controller.apiverifyReferralCode(referralCode: controller.referralEditingController.text.trim());
                            },
                            buttonColor: controller.referralCode.value.isEmpty ? kColorBlueLight : kColorBlueDark,
                          );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customInkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              actions: [kBuildForCalgrows ? PopupScreenForCalgrows() : PopupScreenForCaregiverWidget()],
                            );
                          });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          TrKeys.whereDoIFindMyUPID.name.tr,
                          style: TextStyle(
                              fontFamily: constantOpenSans,
                              fontWeight: FontWeight.w300,
                              fontSize: TextSize.toDouble(),
                              color: kColorBlueDark),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goToSignInScreen() {
    Get.offAndToNamed("/");
  }
}

class TextTitle extends StatelessWidget {
  TextTitle({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: kFontLatoS20W400H2.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class BodyTitle extends StatelessWidget {
  BodyTitle({Key? key, required this.text, this.color}) : super(key: key);
  String text;
  Color ? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style:color != null ?kFontPoppinsS20W400SH1.copyWith(color: kColorSteelGray): kFontPoppinsS20W400SH1,
      ),
    );
  }
}
