import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../feedback/models/feedback_response_model.dart';
import '../../styles/colors.dart';
import '../../styles/constantImageWidget.dart';
import '../../styles/font_styles.dart';
import '../../utils/device_related/device_identify.dart';
import '../../modules/chat_with_claude_model/models/chat_with_claude_message_model.dart';
import '../../modules/chat_with_claude_model/services/chat_with_claude_model_screen_services.dart';



class MessageWidget extends GetView<ChatWithClaudeModelScreenServices> {

  const MessageWidget({super.key, required this.message, required this.messageType});
  final String message;
  final String messageType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if(messageType == EnumMessageStatus.sent.name)Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ///container for content/chats
                        Flexible(
                          child: Container(
                              margin: EdgeInsets.only(right: context.isPhone ? 15 : 10),
                              // constraints: const BoxConstraints(maxWidth: 340, minWidth: 40),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: kColorSteelGray,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SelectableText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: message.trim(), style: kFontNotoSans.copyWith(
                                      fontSize: 15, fontWeight: FontWeight.w400, color: kColorBlack)),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        kImageH3(
                            imageUrl: "",
                            name:(messageType)),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     DateFormat('hh:mm a')
                    //         .format(DateTime.fromMillisecondsSinceEpoch(data["messageTime"]))
                    //         .toString(),
                    //     style: kFontNotoSans.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: kColorGray),
                    //   ),
                    // ),
                  ],
                ),
              ),
                ///Feedback Form

                  ///by simplechat api
            if(messageType == EnumMessageStatus.received.name)Container(
              margin: EdgeInsets.only(left: context.isPhone ? 30 : 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ///image is here
                      Image(
                          alignment: Alignment.centerLeft,
                          height: kDevicesIsMobile(context) ? 20 : 25,
                          width: kDevicesIsMobile(context) ? 25 : 30,
                          image: const AssetImage("images/icons/stanford_logo_without_text.png")),


                      // kImageH3(
                      //     imageUrl: "",
                      //     name:(messageType)),
                      const SizedBox(width: 5),
                      ///container for content/chats
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kColorMaroonLight,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child:  SelectableText.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: message.trim(), style: kFontNotoSans.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w400, color: kColorBlack)),
                              ],
                            ),
                          ),
                          // Text(message.trim(), style: kFontNotoSans.copyWith(
                          //     fontSize: 15, fontWeight: FontWeight.w400, color: kColorBlack),),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 30),
                  //   child: Text(
                  //     DateFormat('hh:mm a')
                  //         .format(DateTime.fromMillisecondsSinceEpoch(data["messageTime"]))
                  //         .toString(),
                  //     style: kFontNotoSans.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: kColorGray),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 2),

          ],
        ),
      ],
    );
  }
}
