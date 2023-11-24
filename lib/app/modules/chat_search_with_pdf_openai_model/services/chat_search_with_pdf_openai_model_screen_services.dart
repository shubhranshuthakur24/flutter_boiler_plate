
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/feedback/services/feedback_mixin.dart';
import '../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../helpers/api_related_services/api_response.dart';
import '../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../helpers/api_related_services/client.dart';
import '../../../helpers/global_mixin_classes/api_related_mixins/chat_api_mixin.dart';
import '../../../helpers/global_mixin_classes/api_related_mixins/new_chat_patient_doctor_query_mixin.dart';
import '../../../helpers/global_mixin_classes/device_related_mixins/ip_address_mixin.dart';
import '../../../helpers/global_mixin_classes/device_related_mixins/pdf_upload_mixin.dart';
import '../../../styles/constants.dart';
import '../models/chat_search_with_pdf_openai_message_model.dart';


class ChatSearchWithPdfOpenAIModelScreenServices extends GetxController  with ChatApiMixin, ChatApiPatientDoctorsQueryMixin, MixinFeedbackResponse, IpAddressMixin, GetPDFMixin{
  final openAIPdfTextController = TextEditingController();
  final RxBool isSimpleChatApiLoading = false.obs;
  final RxBool showFeedbackResponseForm = false.obs;


  @override
  Future<void> onInit() async {
    super.onInit();

    // await getUserIpAddress().then((value) {
    //   userIpAddress.value = value.toString();
    //   apiPostUpdateLogin(userIpAddress: value.toString());
    // });
    // apiGetAllTrainingList();
    // chatApiCallTest(senderMessage: "What is python language ? ");


  }
  @override
  void dispose() {
    openAIPdfTextController.dispose();
    super.dispose();
  }


}
