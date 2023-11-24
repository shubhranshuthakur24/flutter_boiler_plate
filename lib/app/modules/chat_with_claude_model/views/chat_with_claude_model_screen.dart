import 'package:flutter_boiler_plate/app/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_boiler_plate/app/styles/colors.dart';
import '../../../components/chat_input_feild/chat_input_feild.dart';
import '../../../components/feedback/views/feedback_response_with_star_widget.dart';
import '../../../components/feedback/views/widgets/feedback_star_widget.dart';
import '../../../components/feedback/views/widgets/rating_text_widget.dart';
import '../../../components/feedback/views/widgets/response_recorded_dialog_widget.dart';
import '../../../components/feedback/views/widgets/star_rating_widget.dart';
import '../../../components/feedback/views/widgets/submit_button.dart';
import '../../../components/feedback/views/widgets/user_feedback_widget.dart';
import '../../../components/loading_widget/loading_chat_widget.dart';
import '../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../utils/device_related/device_identify.dart';
import '../models/chat_with_claude_message_model.dart';
import '../services/chat_with_claude_model_screen_services.dart';
import '../../../components/message_widget/global_message_widget.dart'; // Import your message widget

class ChatWithClaudeModelScreen
    extends GetView<ChatWithClaudeModelScreenServices> {
   const ChatWithClaudeModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideBarPanel(
        rightSideMargin: false,
        showSideMenu: true,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chat | Claude",
                        style: TextStyle(
                            fontSize: 20,
                            color: kColorMaroon,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Obx(() {
                      return Container(
                        color: kColorWhite,
                        child: ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.chatMessagesList.length,
                          itemBuilder: (context, index) {
                            ChatWithClaudeMessageModel data = controller
                                .chatMessagesList[index];
                            return MessageWidget(
                              message: data.message,
                              messageType: data.messageType,);
                          },
                        ),
                      );
                    }),
                  ),
                  Obx(() {
                    return (controller.isSimpleChatApiLoading.value)
                        ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        color: kColorWhite,
                        child: const BouncingLoadingCircularContainer()
                    ) : Container();
                  })
                ],
              ),
            ),
            Obx(() {
              return controller.showFeedbackResponseForm.value
                  ?FeedBackResponseWithStarWidget(
                starWidget: FeedbackStarRating(
                  rating: 5,
                  starSize: 30,
                  starCount: 5,
                  ratedStarColor: kColorMaroon,
                  unratedStarBorderColor: kColorGray.withOpacity(0.4),
                  borderThickness: 2.0,
                  onRatingChanged: (rating) {
                    controller.starRating.value = rating as int;
                  },
                ), starRatingWidget: StarRatingWidget(starRating: controller.starRating.value,),
                ratingTextWidget: RatingTextWidget(textBasedOnInput:controller.getStringBasedOnStarRating(controller.starRating.value) ,),
                userFeedbackWidget:
                  UserFeedbackWidget(
                    responsesList: controller.responsesList,
                    onSelectionChanged: (returnedValue ) {
                    controller.responseToSend.value = returnedValue.join(",");
                    showPrint(controller.responseToSend.value);
                  },),
                submitWidget:(controller.apiFeedbackResponseLoading.value)?showSpinkitRing():  SubmitWidget(onSubmit: () {
                  controller.apiPostFeedbackResponse(
                      ipAddress: controller.userIpAddress.value,
                      userRating: controller.starRating.value.toString(),
                      comment: controller.responseToSend.value).then((value){
                    controller.starRating.value = 0 ;
                    controller.showFeedbackResponseForm.value = false;
                    showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return   const ResponseRecordedWidget();
                            });
                  });
                  },),
                onTapCrossButton: () { controller.showFeedbackResponseForm.value = false; },
              )
                  : Container(color: kColorWhite,);
            }),
            CustomChatInput(
              textController: controller.simpleChatTextController,
              onMessageSubmit: (text) {
                controller.handleEnterKey(isApiLoading: controller.isSimpleChatApiLoading, messageInput: controller.simpleChatTextController.text, inputTextEditingController: controller.simpleChatTextController, isFeedbackFormVisible: controller.showFeedbackResponseForm, apiUrlFromScreen: ApiEndpoints.simpleChatWithClaudeModel);
              },
              onSendTap: () {
                String message = controller.simpleChatTextController.text;
                if(!controller.isSimpleChatApiLoading.value) {
                  controller.apiGetChatData(sentMessages: message,
                      apiUrlFromScreen: ApiEndpoints.simpleChatWithClaudeModel,
                      isApiLoading: controller.isSimpleChatApiLoading,
                      inputTextEditingController: controller.simpleChatTextController, isFeedbackFormVisible: controller.showFeedbackResponseForm);
                }

              }, onAttachmentTap: () {  }, isAttachmentAvailable: false,),
          ],
        ),
      ),
    );
  }
}

