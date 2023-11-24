import 'package:flutter_boiler_plate/app/utils/device_related/device_identify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/constants.dart';
import '../../../../styles/font_styles.dart';
import '../../../../styles/k_icons.dart';
import '../../../chat_response_widget/chat_response_widget.dart';
import '../../../side_menu/views/widgets/on_hover_widget.dart';
import 'chekmark_widget.dart';

class ResponseRecordedWidget extends StatelessWidget {
  const ResponseRecordedWidget({super.key, this.chatResponseText});
  final String ? chatResponseText ;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.back();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return    ChatResponseWidget(chatResponseText: chatResponseText ?? "",);
          });
    });

    return  AlertDialog(
      content: Container(
        width: kDevicesIsMobile(context)?300:MediaQuery.of(context).size.width * 0.4,
        height: kDevicesIsMobile(context)?200:MediaQuery.of(context).size.width * 0.2,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OnHover(
                  builder: (isHovered) {
                    return customInkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 17),
                        alignment: Alignment.topRight,
                        child: Icon(
                          color: isHovered ? kColorMaroon : kColorGray.withOpacity(0.4),
                          crossIcon,
                          size: 24,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const CheckmarkCircleWidget(),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Response Recorded Successfully!!.',
                    style: kFontLatoS20W400H2.copyWith(color: kColorMaroon),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
