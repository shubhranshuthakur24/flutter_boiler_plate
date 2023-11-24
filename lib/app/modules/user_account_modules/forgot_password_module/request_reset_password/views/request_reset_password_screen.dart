import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/const_widgets/custom_app_bar_notificaton_page.dart';
import '../../../../../components/const_widgets/universal_widgets.dart';
import '../../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constant_font_size.dart';
import '../../../../../styles/constants.dart';
import '../../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../services/button_color_change_when_all_required_feild_are_filled.dart';
import '../services/request_reset_password_services.dart';

class RequestResetPasswordScreen extends StatefulWidget {
  const RequestResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _RequestResetPasswordScreenState createState() => _RequestResetPasswordScreenState();
}

class _RequestResetPasswordScreenState extends State<RequestResetPasswordScreen> {
  RequestResetPasswordServices forgotPasswordServicesController = Get.put(RequestResetPasswordServices());
  final RequestResetPaswordScreenButtonColorChageWhenAllRequiredFeildAreFilled
      _resetPaswwordScreenButtonColorChageWhenAllRequiredFeildAreFilled =
      Get.put(RequestResetPaswordScreenButtonColorChageWhenAllRequiredFeildAreFilled());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorSteelGray,
      resizeToAvoidBottomInset: false,
      body: SideBarPanel(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customAppBarNotificationPage(
                leftSideIcon: crossIcon,
                appBarTitle: TrKeys.resetPassword.name.tr,
                onTapLeftSideIcon: () {
                  Get.back();
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    Text(TrKeys.enterTheEmailAddressAssociatedWithYourAccountAndWellEmailYouAResetCode.name.tr),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldTittle(textFildTittle: TrKeys.email.name.tr),
                    LogInTextFields(
                      voidCallback: forgotPasswordServicesController.returnValue,
                      controller: _resetPaswwordScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                      hintText: "",
                      labelText: '',
                      textEditingController: forgotPasswordServicesController.emailController,
                      formKey: forgotPasswordServicesController.formKey,
                      maxLength: 100,
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return forgotPasswordServicesController.requestPasswordButtonPressed.isTrue
                          ? showSpinkitRing()
                          : Obx(() {
                              return Container(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: _resetPaswwordScreenButtonColorChageWhenAllRequiredFeildAreFilled
                                            .allFieldAllVerifeid.isTrue
                                        ? kColorBlueDark
                                        : kColorBlueLight,
                                    borderRadius: const BorderRadius.all(Radius.circular(kBorderRadius))),
                                child: MaterialButton(
                                  onPressed: () {
                                    forgotPasswordServicesController.emailTextValidation();
                                  },
                                  child: Text(
                                    TrKeys.verify.name.tr,
                                    style: TextStyle(color: kColorWhite, fontSize: kFontSize14),
                                  ),
                                ),
                              );
                            });
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
