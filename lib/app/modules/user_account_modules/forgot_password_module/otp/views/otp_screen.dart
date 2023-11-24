import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constant_font_size.dart';
import '../../../../../styles/constants.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../request_reset_password/views/request_reset_password_screen.dart';
import '../services/button_color_change_when_all_required_feild_are_filled.dart';
import '../services/countdown_services.dart';
import '../services/otp_services.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  CountdownServices countdownServices = Get.put(CountdownServices());
  final OtpScreenButtonColorChageWhenAllRequiredFeildAreFilled _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled =
      Get.put(OtpScreenButtonColorChageWhenAllRequiredFeildAreFilled());
  OtpScreenServices otpScreenServices = Get.put(OtpScreenServices());

  @override
  void initState() {
    super.initState();
    try {
      otpScreenServices.enteredEmail = Get.arguments;
    } catch (ignoredError) {}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: kColorSteelGray,
          body: SideBarPanel(
            child: Obx(() {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // customAppBarNotificationPage(
                    //     onTapLeftSideIcon: () {
                    //       Get.back();
                    //     },
                    //     appBarTitle: TrKeys.verificationCode.name.tr,
                    //     leftSideIcon: backIcon),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            "${TrKeys.weSentYourCodeTo.name.tr} ${otpScreenServices.enteredEmail.trim()}",
                            style: TextStyle(fontSize: kFontSize14, fontWeight: FontWeight.w400, color: kColorBlack),
                          ),
                          if (countdownServices.start.value == 0)
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(color: kColorRedLight, borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 11),
                                    child: Image.asset(
                                      "images/icons/infoRed.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      TrKeys.timeLimitExceededPleaseClickOnResendVerificationCodeToGetNewOTP.name.tr,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: kFontSize14, fontWeight: FontWeight.w400, color: kColorBlack),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (countdownServices.start.value != 0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  TrKeys.thisCodeWillExpireIn.name.tr,
                                  style: TextStyle(fontSize: kFontSize14, fontWeight: FontWeight.w400, color: kColorBlack),
                                ),
                                Text(
                                  countdownServices.start.value.toString(),
                                  style: const TextStyle(color: kColorBlack),
                                ),
                                Text(
                                  " ${TrKeys.second.name.tr}",
                                  style: TextStyle(fontSize: kFontSize14, fontWeight: FontWeight.w400, color: kColorBlack),
                                ),
                              ],
                            ),
                          const SizedBox(height: 15),
                          const OtpForm(),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                if (countdownServices.start.value == 0) {
                                  Get.off(() => const RequestResetPasswordScreen(), transition: Transition.noTransition);
                                }
                              },
                              child: Text(
                                TrKeys.resendVerificationCode.name.tr,
                                style: TextStyle(
                                    color: countdownServices.start.value == 0 ? kColorBlueDark : kColorBlueLight,
                                    fontSize: kFontSize16),
                              )),
                          SizedBox(
                            child: otpScreenServices.continueButtonPressed.value
                                ? showSpinkitRing()
                                : MaterialButton(
                                    minWidth: double.infinity,
                                    height: 50,
                                    color: (_otpScreenButtonColorChageWhenAllRequiredFeildAreFilled.allFieldAllVerifeid.value ==
                                                true &&
                                            countdownServices.start.value != 0)
                                        ? kColorBlueDark
                                        : kColorBlueLight,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
                                    onPressed: () {
                                      if (countdownServices.start.value != 0) otpScreenServices.formValidationOtpScreen();
                                    },
                                    child: Text(
                                      TrKeys.Continue.name.tr,
                                      style: TextStyle(color: kColorWhite, fontSize: kFontSize16),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 36)
                        ],
                      ),
                    ))
                  ],
                ),
              );
            }),
          ),
        ),
        onWillPop: () async {
          Get.off(() => const RequestResetPasswordScreen());
          return false;
        });
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  OtpScreenServices otpScreenServices = Get.find();
  final OtpScreenButtonColorChageWhenAllRequiredFeildAreFilled _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled =
      Get.find();
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          child: TextFormField(
            maxLength: 1,
            controller: otpScreenServices.firstDigitOtp,
            style: TextStyle(fontSize: kFontSize24),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                errorMaxLines: 2,
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled.textFieldValidation();
              nextField(value, pin2FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            maxLength: 1,
            controller: otpScreenServices.secondDigitOtp,
            focusNode: pin2FocusNode,
            style: TextStyle(fontSize: kFontSize24),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                errorMaxLines: 2,
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled.textFieldValidation();
              nextField(value, pin3FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            maxLength: 1,
            controller: otpScreenServices.thirdOtp,
            focusNode: pin3FocusNode,
            style: TextStyle(fontSize: kFontSize24),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                errorMaxLines: 2,
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled.textFieldValidation();
              nextField(value, pin4FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            maxLength: 1,
            controller: otpScreenServices.fourthDigitOtp,
            focusNode: pin4FocusNode,
            style: TextStyle(fontSize: kFontSize24),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                errorMaxLines: 2,
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled.textFieldValidation();
              nextField(value, pin5FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            maxLength: 1,
            controller: otpScreenServices.fifthDigitOtp,
            focusNode: pin5FocusNode,
            style: TextStyle(fontSize: kFontSize24),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                errorMaxLines: 2,
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled.textFieldValidation();
              nextField(value, pin6FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            maxLength: 1,
            controller: otpScreenServices.sixthDigitOtp,
            focusNode: pin6FocusNode,
            style: TextStyle(fontSize: kFontSize24),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                errorMaxLines: 2,
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              _otpScreenButtonColorChageWhenAllRequiredFeildAreFilled.textFieldValidation();
              pin6FocusNode.unfocus();
            },
          ),
        ),
      ],
    ));
  }
}
