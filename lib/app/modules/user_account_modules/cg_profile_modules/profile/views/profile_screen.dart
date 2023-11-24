import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/font_styles.dart';
import '../../../user_profille/view/user_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuServices controller = Get.find();
    return Scaffold(
      backgroundColor: kColorSteelGray,
      body: SideBarPanel(
        showSideMenu: true,
        child: Obx(() {
          return Align(
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
                            name:
                                "cgFirstName cgLastName",
                            city:
                                "City ${true ? ", " : ""} state",
                            onTapEditProfileButton: () {
                              // Get.to(() => const ProfileUpdateScreen(), transition: Transition.noTransition);
                            },
                            profileUrl: "",
                            dob: "04-06-2004",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          headingAndBodyWidget(
                              disabledBool: true,
                              heading: "Email",
                              body: "email@domainName.com",
                              icon: "emailblue.png"),
                          headingAndBodyWidget(
                              disabledBool: false,
                              heading: "Zip Code",
                              body: "110084",
                              icon: "zipCodeBlue.png"),
                          headingAndBodyWidget(
                              disabledBool: false,
                              heading: "Year Of Birth",
                              body: "04-06-2004",
                              icon: "yearOfBirthBlue.png"),
                          headingAndBodyWidget(
                              disabledBool: false,
                              heading: "Contact Number",
                              body: "988748337",
                              icon: "contractNumberBlue.png"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Column headingAndBodyWidget({required String heading, required String body, required String icon, required bool disabledBool}) {
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: kColorWhite),
          child: Text(
            body,
            style: kFontNotoSansS18W400Para1.copyWith(color: disabledBool ? kColorGray : kColorBlack),
          ),
        )
      ],
    );
  }
}
