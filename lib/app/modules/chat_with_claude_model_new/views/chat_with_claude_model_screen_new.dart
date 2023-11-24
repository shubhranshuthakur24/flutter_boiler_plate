import 'package:flutter_boiler_plate/app/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_boiler_plate/app/styles/colors.dart';

import '../../../components/chat_input_feild/patient_and_doctor_query_input_feild.dart';
import '../../../components/chat_response_widget/chat_response_widget.dart';
import '../../../components/const_widgets/primary_button_style.dart';
import '../../../components/feedback/views/widgets/response_recorded_dialog_widget.dart';
import '../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../helpers/api_related_services/apis_endpoint.dart';
import '../services/chat_with_claude_model_screen_services.dart';

class ChatWithClaudeModelScreenNew
    extends GetView<ChatWithClaudeModelScreenServicesNew> {
  const ChatWithClaudeModelScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideBarPanel(
        rightSideMargin: false,
        showSideMenu: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let us help you",
                        style: kFontNotoSans.copyWith(color: kColorMaroon,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 5),
                color: kColorWhite,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Text(
                          "Patient's Query : ",
                          style: kFontNotoSans.copyWith(color: kColorBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10,),
                        CustomChatQueryInputField(
                            textController: controller.newChatPatientQueryTextController),
                        const SizedBox(height: 10,),
                        Text(
                          "Doctor's Query : ",
                          style: kFontNotoSans.copyWith(color: kColorBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10,),
                        CustomChatQueryInputField(
                            textController: controller.newChatDoctorsQueryTextController,
                            maximumAllowedLines: 15),
                        const SizedBox(height: 50,),
                        // Obx(() {
                        //   return (controller.isSimpleChatApiLoading.value)
                        //       ? Container(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       color: kColorWhite,
                        //       child: const BouncingLoadingCircularContainer()
                        //   ) : Container();
                        // })

                        Row(children: [
                          Expanded(
                              child: Obx(() {
                                return kButtonPrimaryStyle(
                                  buttonName: "Submit",
                                  dynamicColor: kColorMaroon,
                                  onButtonTab: () {
                                    controller.apiPostPatientDoctorsQueryChatData(
                                        apiUrlFromScreen: ApiEndpoints.simpleChatWithClaudeModel,
                                        isApiLoading: controller.isNewChatApiLoading,
                                        doctorsQueryTextEditingController: controller.newChatDoctorsQueryTextController,
                                        patientQueryTextEditingController: controller.newChatPatientQueryTextController).then((value) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ResponseRecordedWidget(chatResponseText:controller.responseFromPatientDoctorsQueryApi.value);
                                          });

                                    });

                                  },
                                  showLoading: controller.isNewChatApiLoading.value,
                                );
                              })
                          ),
                        ],),
                        const SizedBox(height: 10,),
                      ],
                    ),
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

