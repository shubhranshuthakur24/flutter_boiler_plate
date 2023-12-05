import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constantImageWidget.dart';
import '../../../../../styles/constants.dart';
import '../../../../../styles/font_styles.dart';
import '../../../../../styles/k_icons.dart';
import '../../../../../utils/device_related/device_identify.dart';
import '../../profile/views/user_profile_screen.dart';

class MenuScreen extends GetView<MenuServices> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navigateToHomeScreen();
        return false;
      },
      child: Scaffold(
        backgroundColor: kColorSteelGray,
        body: SideBarPanel(
          showSideMenu: true,
          child: Obx(() {
            return Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  kAppBarWidgetWithBackButton(
                    title: "Menu",
                    showSettingIcon: true,
                    onTapBackButton: () {
                      _navigateToHomeScreen();
                    },
                  ),
                  // controller.apiLoading.value || controller.homePageModel.value == null
                      false? showSpinkitRing()
                      : Expanded(
                          child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 28,
                              ),
                              Container(padding: const EdgeInsets.symmetric(horizontal: 19), child: topWidget(context: context)),
                              const SizedBox(
                                height: 23,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 19),
                                child: Column(
                                  children: [
                                    // if (Get.find<TokenServices>().upIdTypeIDModel.value?.upIdTypeID == 1)
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 19),
                                        child: cardWidget(
                                            imageName: "Image Name",
                                            title: "My Expert",
                                            picUrl: "",
                                            onTap: () {
                                              // Get.toNamed(ScreenNames.expert.routeName);
                                            }),
                                      ),
                                    // if (Get.find<TokenServices>().upIdTypeIDModel.value?.upIdTypeID == 1)
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 19),
                                        child: cardWidget(
                                            title: "careRecipient",
                                            picUrl: "",
                                            onTap: () {
                                              // Get.toNamed(ScreenNames.careRecipient.routeName);
                                            }),
                                      ),
                                    if (kDevicesIsMobile(context))
                                      Row(
                                        children: [
                                          buildExpanded(
                                              tittle: "Resources",
                                              iconName: 'resourceUnfillBlue.png',
                                              onTap: () {
                                                // Get.toNamed(ScreenNames.resource.routeName);
                                              }),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          buildExpanded(
                                              tittle: "helpAndSupport",
                                              iconName: 'helpSupportOutLineBlue.png',
                                              onTap: () {
                                                // Get.toNamed(ScreenNames.helpSupport.routeName);
                                              }),
                                        ],
                                      ),
                                    SizedBox(
                                      height: context.height * 0.15,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void _navigateToHomeScreen() {
    // Get.toNamed(ScreenNames.home.routeName);
  }

  Widget cardWidget({required String title, required String picUrl, required VoidCallback onTap, String? imageName}) {
    return customInkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(color: kColorWhite, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 26),
        child: Row(
          children: [
            kImageH2(imageUrl: picUrl, name: imageName ?? title),
            const SizedBox(
              width: 13,
            ),
            Text(
              title,
              style: kFontNotoSansS18W400Para1.copyWith(color: kColorBlack),
            ),
            const Spacer(),
            const Icon(
              CupertinoIcons.forward,
              size: 22,
              color: kColorBlueDark,
            )
          ],
        ),
      ),
    );
  }

  Container topWidget({required BuildContext context}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: kColorBlueDark, borderRadius: BorderRadius.circular(15)),
      padding: kDevicesIsMobile(context)
          ? const EdgeInsets.only(left: 20, top: 30, bottom: 27, right: 5)
          : const EdgeInsets.symmetric(horizontal: 51, vertical: 41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customInkWell(
            onTap: () {
              // Get.to(() => const ProfileScreen(), transition: Transition.noTransition);
            },
            child: Row(
              children: [
                kImageH1(
                    imageUrl: "",
                    name: "cgFirstName"),
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "cgFirstName cgLastName",
                        style: kFontNotoSansS18W400Para1.copyWith(color: kColorWhite, fontWeight: FontWeight.w600),
                      ),

                        Text(
                          "Age: 04-06-2004}",
                          style: kFontNotoSansS18W400Para1.copyWith(
                              color: kColorWhite, fontWeight: FontWeight.w400, fontSize: context.isPhone ? 12 : 15),
                        ),
                        Text(
                          "Location : city ${true ? "" : ","} state",
                          style: kFontNotoSansS18W400Para1.copyWith(
                              color: kColorWhite, fontWeight: FontWeight.w400, fontSize: context.isPhone ? 12 : 15),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          customInkWell(
            onTap: () {
              Get.to(() => const ProfileScreen(), transition: Transition.noTransition);
            },
            child: Container(
              decoration: BoxDecoration(color: kColorWhite, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 11),
              child: Text(
                "View Profile",
                style: kFontNotoSansS13W600Button2.copyWith(color: kColorBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExpanded({required String tittle, required String iconName, required VoidCallback onTap}) {
    return Expanded(
      child: customInkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 23),
          decoration: BoxDecoration(color: kColorWhite, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Image.asset(
                "images/icons/$iconName",
                width: 30, height: 30,
                // height: 200,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                tittle,
                style: kFontNotoSansS13W600Button2.copyWith(color: kColorBlack),
              )
            ],
          ),
        ),
      ),
    );
  }
}
