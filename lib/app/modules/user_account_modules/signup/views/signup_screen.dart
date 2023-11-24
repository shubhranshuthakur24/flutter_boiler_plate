import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/const_widgets/universal_widgets.dart';
import '../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../routes/screen_names.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/constants.dart';
import '../../../../styles/k_icons.dart';
import '../../../../utils/device_related/device_identify.dart';
import '../../../../utils/internationalization_using_getx/tr_keys.dart';
import '../../sign_in/views/widgets/sign_in_screen_bottom_text_widget.dart';
import '../services/button_color_change_when_all_required_feild_are_filled.dart';
import '../services/signup_screen_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupScreenServices signupScreenServicesController = Get.put(SignupScreenServices());
  final SignUpScreenButtonColorChageWhenAllRequiredFeildAreFilled _signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled =
      Get.put(SignUpScreenButtonColorChageWhenAllRequiredFeildAreFilled());

  @override
  void initState() {
    // signupScreenServicesController.referralCode = Get.arguments[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorSteelGray,
      extendBodyBehindAppBar: true,
      body: SideBarPanel(
        child: SafeArea(
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
            // height: kDevicesIsTab(context) ? null : 812,
            width: double.infinity,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 24, left: 24, top: 55),
                          child: Row(
                            children: [
                              customInkWell(
                                onTap: () {
                                  Get.toNamed(ScreenNames.signIn.routeName);
                                },
                                child: const Icon(
                                  CupertinoIcons.back,
                                  color: kColorBlack,
                                  size: 24.0,
                                ),
                              ),
                              const SizedBox(
                                width: 9.73,
                              ),
                              Text(
                                "Sign up",
                                style: TextStyle(
                                    fontFamily: constantOpenSans, color: kColorBlack, fontSize: 24, wordSpacing: -0.3),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 24,
                            left: 24,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 27,
                              ),
                              TextFieldTittle(textFildTittle: TrKeys.firstName.name.tr),
                              LogInTextFields(
                                  formKey: signupScreenServicesController.formKeyFirstName,
                                  voidCallback: signupScreenServicesController.firstNameStringReturn,
                                  controller: _signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                                  textEditingController: signupScreenServicesController.firstNameController,
                                  labelText: "",
                                  hintText: ""),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFieldTittle(textFildTittle: TrKeys.lastName.name.tr),
                              LogInTextFields(
                                  formKey: signupScreenServicesController.formKeyLasttName,
                                  voidCallback: signupScreenServicesController.lastNameStringReturn,
                                  controller: _signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                                  textEditingController: signupScreenServicesController.lastNameController,
                                  labelText: "",
                                  hintText: ""),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFieldTittle(textFildTittle: TrKeys.email.name.tr),
                              LogInTextFields(
                                formKey: signupScreenServicesController.formKeyEmail,
                                voidCallback: signupScreenServicesController.emailStringReturn,
                                controller: _signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                                hintText: "",
                                textEditingController: signupScreenServicesController.emailController,
                                labelText: "",
                                maxLength: 100,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFieldTittle(textFildTittle: TrKeys.password.name.tr),
                              PasswordTextField(
                                  formKey: signupScreenServicesController.formKeyPassword,
                                  voidCallback: signupScreenServicesController.passwordStringReturn,
                                  controller: _signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                                  hintText: "",
                                  textEditingController: signupScreenServicesController.passwordController,
                                  labelText: ""),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFieldTittle(textFildTittle: TrKeys.confirmPassword.name.tr),
                              PasswordTextField(
                                  formKey: signupScreenServicesController.formKeyConfirmPassword,
                                  voidCallback: signupScreenServicesController.confirmPasswordStringReturn,
                                  controller: _signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled,
                                  hintText: "",
                                  textEditingController: signupScreenServicesController.confirmPasswordConfirmController,
                                  labelText: ""),
                              SizedBox(
                                height: kDeviceIsDesktop(context) ? 0 : 35,
                              ),
                            ],
                          ),
                        )
                      ]),
                      if (!kDeviceIsDesktop(context)) const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: kDeviceIsDesktop(context) ? 35 : 0,
                          right: 24,
                          left: 24,
                          bottom: (kDevicesIsMobile(context)) ? 100 : 150,
                        ),
                        child: Column(
                          children: [
                            Obx(() {
                              return signupScreenServicesController.buttonPressed.isTrue
                                  ? showSpinkitRing()
                                  : SizedBox(
                                      height: 40,
                                      // width: 325,,
                                      child: PurpleButton(
                                          buttonStyle:kButtonTextStyle1().copyWith(color:_signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled
                                              .allFieldAllVerifeid.isTrue
                                              ? kColorWhite
                                              : kColorMaroon ),
                                          buttonColor: _signUpScreenButtonColorChageWhenAllRequiredFeildAreFilled
                                                  .allFieldAllVerifeid.isTrue
                                              ? kColorMaroon
                                              : kColorMaroonLight,
                                          text: "Agree and Continue",
                                          press: () {
                                            signupScreenServicesController.textFieldValidation();
                                          }));
                            }),

                            // GoogleButtonWidget(
                            //   buttonName: "Sign up with Google",
                            //   voidCallback: () {
                            //     signupScreenServicesController.googleSignUPPasswordLess();
                            //   },
                            // ),
                            // if (GetPlatform.isIOS && !GetPlatform.isWeb)
                            //   const SizedBox(
                            //     height: 20,
                            //   ),
                            // if (GetPlatform.isIOS && !GetPlatform.isWeb)
                            //   GoogleButtonWidget(
                            //     buttonName: "Sign up with apple",
                            //     voidCallback: () {
                            //       signupScreenServicesController.appleSignUPPasswordLess(context: context);
                            //     },
                            //   )
                          ],
                        ),
                      ),
                      //  SizedBox(
                      //   height:kDeviceIsDesktop(context)?10:0,
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.only(right: 19, left: 14, bottom: 40),
                      //   child: (SignInScreenBottomTextWidget()),
                      // ),
                      // // const SizedBox(
                      // //   height: 20,
                      // // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
