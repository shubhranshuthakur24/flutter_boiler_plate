import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/const_widgets/universal_widgets.dart';
import '../../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constant_font_size.dart';
import '../../../../../styles/constants.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../otp/services/otp_services.dart';
import '../services/new_password_button_color_change_when_all_required_feild_are_filled_widget.dart';
import '../services/reset_password_screen_services.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  _CreateNewPasswordScreenState createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  ResetPasswordScreenServices resetPasswordScreenServicesController = Get.put(ResetPasswordScreenServices());
  final NewPasswordScreenButtonColorChageWhenAllRequiredFeildAreFilled
      _newPasswordScreenButtonColorChageWhenAllRequiredFeildAreFilled =
      Get.put(NewPasswordScreenButtonColorChageWhenAllRequiredFeildAreFilled());
  var padding = const EdgeInsets.fromLTRB(24, 0, 24, 0);

  @override
  void initState() {
    super.initState();
    try {
      NewPasswordScreenArgumentModel newPasswordScreenArgumentModel = Get.arguments;
      resetPasswordScreenServicesController.enteredEmail = newPasswordScreenArgumentModel.email;
      resetPasswordScreenServicesController.enteredOtp = newPasswordScreenArgumentModel.otp;
    } catch (ignoredError) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorSteelGray,
      body: SideBarPanel(
        child: Container(
          color: kColorSteelGray,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // customAppBarNotificationPage(
                //     onTapLeftSideIcon: () {
                //       Get.back();
                //     },
                //     appBarTitle: TrKeys.createNewPassword.name.tr,
                //     leftSideIcon: backIcon),
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          TrKeys.yourNewPasswordShouldBeDifferentFromYourOldPassword.name.tr,
                          style: TextStyle(color: kColorBlack, fontSize: kFontSize16),
                        ),
                        const SizedBox(height: 25),
                        TextFieldTittle(
                          textFildTittle: TrKeys.password.name.tr,
                        ),
                        PasswordTextField(
                          textEditingController: resetPasswordScreenServicesController.passwordController,
                          voidCallback: resetPasswordScreenServicesController.passwordStringReturn,
                          formKey: resetPasswordScreenServicesController.formKeyPassword,
                          controller: _newPasswordScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                          hintText: '',
                          labelText: "",
                        ),
                        TextFieldTittle(textFildTittle: TrKeys.confirmPassword.name.tr),
                        PasswordTextField(
                          textEditingController: resetPasswordScreenServicesController.confirmPasswordController,
                          voidCallback: resetPasswordScreenServicesController.confirmPasswordStringReturn,
                          formKey: resetPasswordScreenServicesController.formKeyConfirmPassword,
                          controller: _newPasswordScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                          hintText: '',
                          labelText: "",
                        ),
                        const Spacer(),
                        Obx(() {
                          return resetPasswordScreenServicesController.requestPasswordButtonPressed.isTrue
                              ? showSpinkitRing(color: kColorBlueDark)
                              : MaterialButton(
                                  minWidth: double.infinity,
                                  height: 50,
                                  color:
                                      _newPasswordScreenButtonColorChageWhenAllRequiredFeildAreFilled.allFieldAllVerifeid.isTrue
                                          ? kColorBlueDark
                                          : kColorBlueLight,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
                                  onPressed: () {
                                    resetPasswordScreenServicesController.formValidationNewPasswordScreen();
                                  },
                                  child: Text(
                                    TrKeys.RESETPASSWORD.name.tr,
                                    style: TextStyle(
                                        color: kColorWhite,
                                        fontSize: kFontSize14,
                                        letterSpacing: .4,
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                        }),
                        const SizedBox(height: 36)
                      ],
                    ),
                  ),
                )

                ///2 textfields
              ],
            ),
          ),
        ),
      ),
    );
  }
}
