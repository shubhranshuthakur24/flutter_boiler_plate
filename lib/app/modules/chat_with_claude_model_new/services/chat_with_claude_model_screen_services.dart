import 'package:chat_app/app/helpers/api_related_services/apis_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/global_mixin_classes/api_related_mixins/new_chat_patient_doctor_query_mixin.dart';



class ChatWithClaudeModelScreenServicesNew extends GetxController with ChatApiPatientDoctorsQueryMixin{
  final newChatPatientQueryTextController = TextEditingController();
  final newChatDoctorsQueryTextController = TextEditingController();
  late RxBool isNewChatApiLoading = false.obs;
  final RxBool showFeedbackResponseForm = false.obs;


  @override
  Future<void> onInit() async {
    super.onInit();


    // apiGetAllTrainingList();
    // chatApiCallTest(senderMessage: "What is python language ? ");


  }
  @override
  void dispose() {
    newChatDoctorsQueryTextController.dispose();
    newChatPatientQueryTextController.dispose();
    super.dispose();
  }


}
