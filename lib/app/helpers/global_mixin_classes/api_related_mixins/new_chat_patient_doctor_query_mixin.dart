import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/constants.dart';
import '../../api_related_services/api_get_post_services.dart';
import 'package:get/get.dart'; // Import Get for RxBool

enum EnumMessageStatus {
  sent,
  received,
}
mixin ChatApiPatientDoctorsQueryMixin {
  late RxString responseFromPatientDoctorsQueryApi = "".obs;
  Future<void> apiPostPatientDoctorsQueryChatData({required String apiUrlFromScreen,required RxBool isApiLoading,required TextEditingController doctorsQueryTextEditingController, required TextEditingController patientQueryTextEditingController}) async {
    try {
      isApiLoading.value = true;
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
        tokenRequired: false,
        apiUrl: apiUrlFromScreen,
        body: {
          "query": doctorsQueryTextEditingController.text.trim(),
          "prompt": patientQueryTextEditingController.text.trim(),
        },
      );
      showPrint(decoded.toString());
      isApiLoading.value = false;
      if (decoded != null && decoded.containsKey("response")) {
        responseFromPatientDoctorsQueryApi.value = decoded["response"];

      }

    } catch (error) {
      showPrint(error.toString());
    }
  }


  Future<void> apiPostGenerateSummaryFromPdf({

    required String filePath,
  }) async {
    try {
      showLoading();
      var request = http.MultipartRequest('POST', Uri.parse('https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/lIm/generate_summery_from_pdf/'));
      request.files.add(await http.MultipartFile.fromPath('file', '/Users/shubhranshuthakur/Downloads/walking_intro.pdf'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        showPrint(await response.stream.bytesToString());
      }
      else {
        showPrint(response.reasonPhrase.toString());
      }
      hideLoading();
    }
    catch (error) {
      showPrint(error.toString());
    }
  }
}
