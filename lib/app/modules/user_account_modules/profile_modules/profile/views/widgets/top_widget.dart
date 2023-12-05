import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../styles/colors.dart';
import '../../../../../../styles/constantImageWidget.dart';
import '../../../../../../styles/font_styles.dart';
import '../../../../../../styles/k_icons.dart';
import '../../../../../../utils/device_related/device_identify.dart';

class TopWidget extends StatelessWidget {
  const TopWidget(
      {Key? key,
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: kColorBlueDark, borderRadius: BorderRadius.circular(15)),
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
                        style: kFontNotoSansS18W400Para1.copyWith(color: kColorWhite, fontWeight: FontWeight.w600),
                      ),
                    ),
                    if (dob.trim().isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        child: Text(
                          "Age: 18",
                          style: kFontNotoSansS18W400Para1.copyWith(
                              color: kColorWhite, fontWeight: FontWeight.w400, fontSize: context.isPhone ? 12 : 15),
                        ),
                      ),
                    if (city.trim().isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        child: Text(
                          "Location: $city",
                          style: kFontNotoSansS18W400Para1.copyWith(
                              color: kColorWhite, fontWeight: FontWeight.w400, fontSize: context.isPhone ? 12 : 15),
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
                    decoration: BoxDecoration(color: kColorWhite, borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 11),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/icons/editBlack.png",
                          width: 16,
                          height: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Edit Profile",
                          style: kFontNotoSansS13W600Button2.copyWith(color: kColorBlack),
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
