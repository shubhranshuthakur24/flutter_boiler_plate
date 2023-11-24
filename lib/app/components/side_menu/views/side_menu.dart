import 'package:flutter_boiler_plate/app/components/side_menu/views/widgets/on_hover_container_widget.dart';
import 'package:flutter_boiler_plate/app/components/side_menu/views/widgets/on_hover_widget.dart';
import 'package:flutter_boiler_plate/app/components/side_menu/views/widgets/side_bar_menu_icon_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/token_services/token_services.dart';
import '../../../routes/screen_names.dart';
import '../../../styles/colors.dart';
import '../../../styles/k_icons.dart';
import '../../../utils/device_related/device_identify.dart';
import '../services/side_bar_menu_services.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color hoverColor = kColorMaroonLight;
    SideBarMenuServices sideBarMenuServices = Get.put(SideBarMenuServices(), permanent: true);
    return Container(
      color: kColorWhite,
      width: 287,
      height: Get.height,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 62,
                  // ),
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 27),
                    child: customInkWell(
                      onTap: () {
                        Get.offAllNamed(ScreenNames.chat.routeName);
                      },
                      child: Image(
                          alignment: Alignment.centerLeft,
                          height: kDevicesIsMobile(context) ? 114 : 100,
                          width: kDevicesIsMobile(context) ? 211 : 200,
                          image: const AssetImage("images/icons/stanford_logo.png")),
                    ),
                  ),
                  const SizedBox(
                    height: 49 - 17,
                  ),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chat;
                          Get.offAllNamed(
                            ScreenNames.chat.routeName,
                          );
                        },
                        child: SideBarMenuIconNameWidget(
                          selectedSideBar: const [ScreenNames.chat],

                          menuName: "Chat | Claude",
                          isHovered: isHovered, isIconAvailable: false,
                          // isSelectd: true,
                        ),
                      ), isHovered: isHovered,
                    );
                  }),

                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chat;
                          Get.offAllNamed(
                            ScreenNames.chatWithClaudeNew.routeName,
                          );
                        },
                        child: SideBarMenuIconNameWidget(
                          selectedSideBar: const [ScreenNames.chatWithClaudeNew],

                          menuName: "New Chat   + ",
                          isHovered: isHovered, isIconAvailable: false,
                          // isSelectd: true,
                        ),
                      ), isHovered: isHovered,
                    );
                  }),

                  buildSizedBox(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chatClaudePDF;
                          Get.offAllNamed(
                            ScreenNames.chatClaudePDF.routeName,
                          );
                        },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [ScreenNames.chatClaudePDF],
                          menuName: "Chat | Claude | PDF",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chatOpenAIPDF;
                          Get.offAllNamed(
                            ScreenNames.chatOpenAIPDF.routeName,
                          );
                        },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.chatOpenAIPDF,
                          ],
                          menuName: "Chat | Open AI | PDF",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),
                  // const Spacer(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chatClaudeCSV;
                          Get.offAllNamed(
                            ScreenNames.chatClaudeCSV.routeName,
                          );
                        },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.chatClaudeCSV,
                          ],
                          menuName: "Chat | Claude | CSV",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chatOpenAICSV;
                          Get.offAllNamed(
                            ScreenNames.chatOpenAICSV.routeName,
                          );                        },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.chatOpenAICSV,
                          ],
                          menuName: "Chat | Open AI | CSV",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          // sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chatOpenAICSV;
                          // Get.offAllNamed(
                          //   ScreenNames.chatOpenAICSV.routeName,
                          // );
                          },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.history,
                          ],
                          menuName: "History",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          // sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chatOpenAICSV;
                          // Get.offAllNamed(
                          //   ScreenNames.chatOpenAICSV.routeName,
                          // );
                          },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.support,
                          ],
                          menuName: "Support",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          // sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.chatOpenAICSV;
                          // Get.offAllNamed(
                          //   ScreenNames.chatOpenAICSV.routeName,
                          // );
                          },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.feedback,
                          ],
                          menuName: "Feedback",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () {
                          sideBarMenuServices.selectedScreenNameEnums.value = ScreenNames.profile;
                          Get.toNamed(
                            ScreenNames.profile.routeName,
                          );
                          },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.profile,
                          ],
                          menuName: "Profile",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                 const SizedBox(height: 100,),
                  OnHover(builder: (isHovered) {
                    final color = isHovered ? hoverColor : Colors.transparent;
                    return OnHoverContainer(
                      color: color,
                      onHoverChildWidget: customInkWell(
                        onTap: () async {
                          await Get.find<TokenServices>().firebaseAuthSignOut();
                          Get.offAllNamed(
                            ScreenNames.signIn.routeName,
                          );
                        },
                        child: SideBarMenuIconNameWidget(
                          isIconAvailable: false,
                          isHovered: isHovered,
                          selectedSideBar: const [
                            ScreenNames.signOut,
                          ],
                          menuName: "Sign Out",
                        ),
                      ), isHovered: isHovered,
                    );
                  }),
                  buildSizedBox(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox() {
    return const SizedBox(
      height: 25,
    );
  }
}
