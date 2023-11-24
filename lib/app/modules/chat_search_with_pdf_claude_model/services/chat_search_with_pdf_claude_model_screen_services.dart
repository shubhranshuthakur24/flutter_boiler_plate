import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/feedback/services/feedback_mixin.dart';
import '../../../helpers/global_mixin_classes/api_related_mixins/chat_api_mixin.dart';
import '../../../helpers/global_mixin_classes/device_related_mixins/ip_address_mixin.dart';


class ChatSearchWithPdfClaudeModelScreenServices extends GetxController with ChatApiMixin, MixinFeedbackResponse, IpAddressMixin {
  final claudePDFChatTextController = TextEditingController();
  final RxBool isSimpleChatApiLoading = false.obs;
  final RxBool showFeedbackResponseForm = false.obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    await getUserIpAddress().then((value) {
      userIpAddress.value = value.toString();
      apiPostUpdateLogin(userIpAddress: value.toString());
    });
    // apiGetAllTrainingList();
    // chatApiCallTest(senderMessage: "What is python language ? ");


  }
  @override
  void dispose() {
    claudePDFChatTextController.dispose();
    super.dispose();
  }


}
