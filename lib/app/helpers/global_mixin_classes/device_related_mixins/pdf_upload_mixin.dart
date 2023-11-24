
import 'dart:html' as html; // Import for web File class

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../styles/constants.dart';
import '../../api_related_services/api_get_post_services.dart';
import '../../api_related_services/apis_endpoint.dart';

mixin GetPDFMixin {
  RxBool isPDFAPILoading = false.obs;
  String? directoryPath;
  List<PlatformFile>? paths;
  FileType _pickingType = FileType.custom;
  bool userAborted = false;






  Future<void> uploadPdf() async {
    try {
      showLoading();
      directoryPath = null;

      // Pick a single PDF file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        dialogTitle: "Pick PDF file to upload ...",
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;

        var data = FormData.fromMap({
          'file': [
            MultipartFile.fromBytes(
              file.bytes!,
              filename: file.name,
            ),
          ],
        });

        var dio = Dio();
        Response<Map<String, dynamic>> response = await dio.post(
          'https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/llm/generate_summery_from_pdf/',
          data: data,
        );

        if (response.statusCode == 200) {
          showPrint(response.data!['response'].toString());
          showToast(response.data!['response'].toString());
          showPrint("line 60");
        } else {
          // Handle unexpected status codes
          showPrint("Unexpected status code: ${response.statusCode}");
          showToast("Unexpected status code: ${response.statusCode}", showToastInReleaseMode: true);

          // Check if there is additional information in the response body
          if (response.data != null) {
            showPrint("Response data: ${response.data}");
            showToast("Response data: ${response.data}", showToastInReleaseMode: true);
          }
        }
      } else {
        // User canceled the file picking
        showToast("File picking canceled by user.", showToastInReleaseMode: true);
      }
    } catch (e) {
      // Handle any errors that occur during the process
      showPrint("Error: $e");

      // Check if the error is a DioError and contains additional information
      if (e is DioError && e.response != null) {
        showPrint("DioError response data: ${e.response!.data}");
        showToast("DioError response data: ${e.response!.data}", showToastInReleaseMode: true);
      }
    } finally {
      // This will be executed regardless of whether there was an error or not
      hideLoading();
    }
  }



  Future<void> apiUploadPdfFile({required String userIpAddress}) async {
    isPDFAPILoading.value = true;
    try {
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
          tokenRequired: false,
          apiUrl: ApiEndpoints.updateLogin,
          body:{
            "ip":"userIpAddress",
          }
      );
      showPrint(decoded.toString());
      if (decoded != null) {
        // String apiResponse = decoded["response"];

        // if (apiResponse.isNotEmpty) {
        //   // Create a MessageModel instance for the received message
        //   // ChatWithClaudeMessageModel receivedMessage = ChatWithClaudeMessageModel(
        //   //   message: receivedMessageFromApiResponse,
        //   //   messageType: EnumMessageStatus.received.name,
        //   // );
        //   // apiLoading.value = false;
        //   // chatMessagesList.add(receivedMessage);
        // }
      }
    } catch (error) {
      showPrint(error.toString());
    }
  }
}