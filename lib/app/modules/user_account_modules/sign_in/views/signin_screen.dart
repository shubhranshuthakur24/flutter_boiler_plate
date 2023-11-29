import 'package:flutter_boiler_plate/app/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/const_widgets/change_with_image_widget.dart';
import '../../../../components/const_widgets/universal_widgets.dart';
import '../../../../components/side_menu/views/widgets/on_hover_widget.dart';
import '../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../helpers/token_services/token_services.dart';

import '../../../../routes/screen_names.dart';
import '../../../../styles/constants.dart';
import '../../../../styles/font_styles.dart';
import '../../../../styles/k_icons.dart';
import '../services/button_color_change_when_all_required_feild_are_filled.dart';
import '../services/sign_in_screen_services.dart';


class SignInScreen extends GetView<SignInScreenServices> {
  const SignInScreen({Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    TokenServices tokenServices = Get.put(TokenServices(), permanent: true);

    final SignInScreenButtonColorChageWhenAllRequiredFeildAreFilled signInScreenButtonColorChageWhenAllRequiredFeildAreFilled =
    Get.put(SignInScreenButtonColorChageWhenAllRequiredFeildAreFilled());
    controller.formKey = GlobalKey<FormState>();
    controller.formKeyPassword = GlobalKey<FormState>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kColorSteelGray,
      body: SideBarPanel(
        child: Container(
            margin:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.06 ),
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x4C929292),
                blurRadius: 28,
                offset: Offset(2, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),

                        const ChangeThisWidgetWithImage(containerHeight: 50, containerWidth: 250,),
                        //const Image(
                          //   // height: 100,
                          //   width: 200,
                          //   isAntiAlias: true,
                          //   alignment: Alignment.centerLeft,
                          //   image: AssetImage("images/icons/stanford_logo.png"),
                          // ),
                        const SizedBox(height: 25),
                         Align(
                           alignment: Alignment.centerLeft,
                           child: Padding(
                             padding: const EdgeInsets.only(left: 5, bottom: 10), child: Text(
                               'SIGN IN',
                               style: TextStyle(fontFamily: constantLato, fontSize: 15, fontWeight: FontWeight.w600, color: kColorMaroon),
                             ),
                           ),
                         ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextFieldTittle(textFildTittle: "USERNAME"),
                        ),
                        LogInTextFields(
                          voidCallback: controller.returnValue,
                          formKey: controller.formKey,
                          controller: signInScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                          hintText: "",
                          textEditingController: controller.emailController,
                          labelText: "",
                          maxLength: 100,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextFieldTittle(textFildTittle: "PASSWORD"),
                        ),
                        PasswordTextField(
                          formKey: controller.formKeyPassword,
                          voidCallback: controller.returnValuePassword,
                          controller: signInScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                          hintText: "",
                          textEditingController: controller.passwordController,
                          labelText: "",
                        ),
                        // SizedBox(height: 9,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: customInkWell(
                            onTap: () {
                              // Get.to(() => const RequestResetPasswordScreen(), transition: Transition.noTransition);
                            },
                            child: Text(
                             "Forget Password",
                              style: kFontNotoSansS15W600Button1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),

                        Column(children: [
                          Obx(() {
                            return controller.signInButtonPressed.isTrue
                                ? showSpinkitRing()
                                : SizedBox(
                                height: 52,
                                // width: 325,,
                                child: Obx(() {
                                  return PurpleButton(
                                      buttonStyle:signInScreenButtonColorChageWhenAllRequiredFeildAreFilled.allFieldAllVerified.isTrue?kFontNotoSansS15W600Button1.copyWith(color: kColorWhite): kFontNotoSansS15W600Button1.copyWith(color: kColorMaroon),
                                      buttonColor:
                                      signInScreenButtonColorChageWhenAllRequiredFeildAreFilled.allFieldAllVerified.isTrue
                                          ? kColorMaroon
                                          : kColorMaroonLight,
                                      text: "Sign In",
                                      press: () {
                                        controller.textFieldValidation();
                                      });
                                }));
                          }),
                          const SizedBox(
                            height: 18,
                          ),
                        ]),
                      ],
                    ),
                    customInkWell(
                      child: OnHover(
                        isTransform: false,
                        builder: (bool isHovered) {
                          return Container(
                            height: 52,
                            decoration: BoxDecoration(
                                color: isHovered ? kColorMaroon : kColorWhite,
                                borderRadius: BorderRadius.circular(36),
                                border: Border.all(width: 1, color: kColorMaroon)),
                            // padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: isHovered
                                      ? kFontNotoSansS15W600Button1.copyWith(color: kColorWhite)
                                      : kFontNotoSansS15W600Button1.copyWith(color: kColorMaroon),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      onTap: () {
                        Get.toNamed(
                          ScreenNames.signUp.routeName,
                        );
                      },
                    ),

                  ],
                ),

            )])
          ),
        ));
  }
}

