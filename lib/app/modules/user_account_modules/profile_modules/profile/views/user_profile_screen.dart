import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/app/styles/constants.dart';
import 'package:get/get.dart';


import '../../../../../components/const_widgets/change_with_image_widget.dart';
import '../../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../../helpers/token_services/token_services.dart';
import '../../../../../routes/screen_names.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constantImageWidget.dart';
import '../../../../../styles/font_styles.dart';
import '../../../../../styles/k_icons.dart';
import '../../../../../utils/device_related/device_identify.dart';
import '../services/user_profile_services.dart';

class ProfileScreen extends GetView <ProfileScreenServices> {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          backgroundColor: kColorSteelGray,
          body:SideBarPanel(
            showSideMenu: true,
            child:controller.apiLoading.value ?showSpinkitRing():controller.userScreenModel.value != null?
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  const kAppBarWidgetWithBackButton(
                    title: "Profile",
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 19),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 28,
                            ),
                            TopWidget(
                              heading: "Profile",
                              name: "${controller.userScreenModel.value!.cgFirstName}  ${controller.userScreenModel.value!.cgLastName}",
                              city: controller.userScreenModel.value!.city,
                              onTapEditProfileButton: () {
                                Get.toNamed(ScreenNames.editProfile.routeName);
                              },
                              profileUrl:controller.apiLoading.value ?"https://firebasestorage.googleapis.com/v0/b/flutterboilerplatehub9.appspot.com/o/media%2Fn0ZqYFh0pTVoJznLc199oj6Se9n1%2Fimages%2FuserProfilePic?alt=media&token=cd7c0571-aaa4-4338-b28e-5f9acb5360ab": Get.find<TokenServices>().userProfileUrlUniversal.value.toString(),
                              dob: controller.userScreenModel.value!.age,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            headingAndBodyWidget(
                              disabledBool: true,
                              heading: "Email",
                              body: controller.userScreenModel.value!.email,
                              icon: "emailblue.png",
                            ),
                            headingAndBodyWidget(
                              disabledBool: false,
                              heading: "First Name",
                              body: controller.userScreenModel.value!.cgFirstName,
                              icon: "zipCodeBlue.png",
                            ),
                            headingAndBodyWidget(
                              disabledBool: false,
                              heading: "Last Name",
                              body: controller.userScreenModel.value!.cgLastName,
                              icon: "yearOfBirthBlue.png",
                            ),
                            headingAndBodyWidget(
                              disabledBool: false,
                              heading: "Contact Number",
                              body: "phone",
                              icon: "contractNumberBlue.png",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):showSpinkitRing(),
          ),
        );
    });
  }


  Column headingAndBodyWidget({
    required String heading,
    required String body,
    required String icon,
    required bool disabledBool,
  }) {
    return Column(
      children: [
        HeadingWidget(heading: heading, icon: icon),
        const SizedBox(
          height: 9,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          margin: const EdgeInsets.only(bottom: 19),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: kColorWhite),
          child: Text(
            body,
            style: kFontNotoSansS18W400Para1.copyWith(
                color: disabledBool ? kColorGray : kColorBlack),
          ),
        )
      ],
    );
  }

}


class MenuServices extends GetxController {
  static bool isScreenCalledFromHomeScreen = false;

  @override
  onInit() {
    super.onInit();
    // apiGetCgProfile();
    // apiGetCareGiverDetails();
  }

  static String ageCalculator(String dob) {
    String age = "";
    try {
      var dobSplit = dob.split("-");
      age = (DateTime
          .now()
          .year
          .toInt() - int.parse(dobSplit.last)).toString();
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
    return age.toString();
  }
}


class kAppBarWidgetWithBackButton extends StatelessWidget {
  const kAppBarWidgetWithBackButton(
      {Key? key, this.titleLeftAlign = false, required this.title, this.showSettingIcon = false, this.onTapBackButton})
      : super(key: key);
  final String title;
  final bool showSettingIcon;
  final VoidCallback? onTapBackButton;
  final bool titleLeftAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kColorWhite,
          border: Border(bottom: BorderSide(color: kColorGrayLight))),
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 13, right: 8, left: 8),
      height: context.isPhone ? 80 : 103,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.red,
                      child: customInkWell(
                          onTap: onTapBackButton ??
                                  () {
                                Get.back();
                              },
                          child: Container(
                            padding: context.isPhone
                                ? const EdgeInsets.only(
                                top: 4, right: 8, left: 8)
                                : const EdgeInsets.only(
                                top: 7, right: 8, left: 8),
                            child: const ChangeThisWidgetWithImage(
                              containerHeight: 20, containerWidth: 50,),
                            // Image.asset(
                            //   "images/icons/backBlack.png",
                            //   // width: context.isPhone ? 16 : 30,
                            //   height: context.isPhone ? 20 : 30,
                            // ),
                          )),
                    ),
                    // const Spacer(),

                    const SizedBox(
                      width: 16.72,
                    ),
                    Expanded(
                      child: Container(
                        alignment: context.isPhone
                            ? titleLeftAlign
                            ? null
                            : Alignment.bottomCenter
                            : null,
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          title,
                          style: context.isPhone
                              ? kFontLatoS20W400H2
                              : kFontLatoS30W400H1,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    // const Spacer(),
                    kDevicesIsMobile(context)
                        ? showSettingIcon
                        ? customInkWell(
                        onTap: () {
                          // Get.toNamed(ScreenNames.setting.routeName);
                        },
                        child: Container(
                          padding: context.isPhone
                              ? const EdgeInsets.only(top: 4, right: 8, left: 8)
                              : const EdgeInsets.only(
                              top: 7, right: 8, left: 8),
                          // padding: context.isPhone
                          //     ? const EdgeInsets.only(top: 11, right: 8, left: 8)
                          //     : const EdgeInsets.only(top: 7, right: 8, left: 8),
                          child: Image.asset(
                            "images/icons/settingBlack.png",
                            // width: context.isPhone ? 19 : 30,
                            height: context.isPhone ? 20 : 30,
                          ),
                        ))
                        : const Icon(
                      CupertinoIcons.back,
                      color: Colors.transparent,
                    )
                        : Container(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}


class TopWidget extends StatelessWidget {
  const TopWidget({Key? key,
    required this.heading,
    required this.name,
    required this.city,
    required this.onTapEditProfileButton,
    required this.profileUrl,
    required this.dob})
      : super(key: key);
  final String heading;
  final String profileUrl;
  final String name;
  final String city;
  final String dob;
  final VoidCallback? onTapEditProfileButton;

  @override
  Widget build(BuildContext context) {
    showPrint("top widget line 277");
    showPrint(profileUrl.toString());
    showPrint("top widget line 279");
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kColorMaroon, borderRadius: BorderRadius.circular(15)),
      padding: kDevicesIsMobile(context)
          ? const EdgeInsets.only(left: 20, top: 30, bottom: 27)
          : const EdgeInsets.symmetric(horizontal: 51, vertical: 41),
      // padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              kImageH1(imageUrl: profileUrl, name: name),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        name,
                        style: kFontNotoSansS18W400Para1.copyWith(
                            color: kColorWhite, fontWeight: FontWeight.w600),
                      ),
                    ),
                    if (dob
                        .trim()
                        .isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        child: Text(
                          "Age : $dob",
                          style: kFontNotoSansS18W400Para1.copyWith(
                              color: kColorWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: context.isPhone ? 12 : 15),
                        ),
                      ),
                    if (city
                        .trim()
                        .isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        child: Text(
                          "Location : $city",
                          style: kFontNotoSansS18W400Para1.copyWith(
                              color: kColorWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: context.isPhone ? 12 : 15),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          if (onTapEditProfileButton != null)
            Row(
              children: [
                customInkWell(
                  onTap: () {
                    onTapEditProfileButton!();
                  },
                  child: Container(
                    decoration: BoxDecoration(color: kColorWhite,
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 11),
                    child: Row(
                      children: [
                        const ChangeThisWidgetWithImage(),
                        // Image.asset(
                        //   "images/icons/editBlack.png",
                        //   width: 16,
                        //   height: 14,
                        // ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Edit Profile",
                          style: kFontNotoSansS13W600Button2.copyWith(
                              color: kColorBlack),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
        ],
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key, required this.heading, required this.icon})
      : super(key: key);
  final String heading;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ChangeThisWidgetWithImage(),
        // Image.asset(
        //   "images/icons/$icon",
        //   width: 18,
        //   height: 18,
        // ),
        const SizedBox(
          width: 3,
        ),
        Text(
          heading,
          style: kFontPoppinsS15W400SH2,
        )
      ],
    );
  }
}
