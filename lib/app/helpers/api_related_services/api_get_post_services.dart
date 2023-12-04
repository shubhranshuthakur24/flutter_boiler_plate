import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../styles/constants.dart';
import '../token_services/token_services.dart';

abstract class ApiGetPostMethodUniversal {
  static Future<Map<String, dynamic>?> getMethod({required String apiUrl}) async {
    Map<String, dynamic>? apiData;
    try {
      http.Response httpResponse = await http.get(Uri.parse(apiUrl),
          headers: ({"Authorization": "Token ${Get.find<TokenServices>().idToken}"}));
      if (httpResponse.statusCode == 200) {
      } else if (httpResponse.statusCode == 401) {
        // await Get.find<TokenServices>().getAuthTokenFromFirebase();
        httpResponse = await http.get(Uri.parse(apiUrl),
            headers: ({"Authorization": "Token ${Get.find<TokenServices>().idToken}"}));
      }
      apiData = jsonDecode(httpResponse.body);
    } catch (error) {
      _capturingErrorFromApi(decoded: apiData, apiUrl: apiUrl, body: "", apiMethodName: "get");
    }
    _capturingErrorFromApi(decoded: apiData, apiUrl: apiUrl, body: "", apiMethodName: "get");

    if (apiData != null && apiData["status"] == "success") {
      return apiData;
    }
    // showToast("Please contact at support@givers.health", showToastInReleaseMode: true);
    _goToTemporarilyUnavailableScreen(apiData: apiData);
    return null;
  }


  static Future<Map<String, dynamic>?> postMethod({
    required String apiUrl,
    Map<String, dynamic>? body,
    Map<String, dynamic>? requestData,
    bool tokenRequired = true,

  }) async {
    Map<String, dynamic>? apiData;
    try {
      var headers = {
        'Content-Type': 'application/json'};
      if (tokenRequired != false) {
        headers['Authorization'] = "Token ${Get.find<TokenServices>().idToken}" ;
      }

    final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        apiData = json.decode(response.body); // Decode the JSON response
      } else {
        showPrint(response.reasonPhrase.toString());
      }
    } catch (error) {
      _capturingErrorFromApi(decoded: apiData, apiUrl: apiUrl, body: body, apiMethodName: "post");
    }

    _capturingErrorFromApi(decoded: apiData, apiUrl: apiUrl, body: body, apiMethodName: "post");

    if (apiData != null && apiData["status"] == "success") {
      return apiData;
    }
    // showToast("Please contact at support@givers.health", showToastInReleaseMode: true);
    _goToTemporarilyUnavailableScreen(apiData: apiData);
    return null;
  }

  static _capturingErrorFromApi(
      {required Map<String, dynamic>? decoded, required String apiUrl, required var body, required String apiMethodName}) {
    showPrint("///////////////////////////////////////////////////////////////////////////////////////////////////////");
    try {
      if (kDebugMode) {
        showPrint("$apiMethodName api called");
        showPrint("api name: $apiUrl");
        showPrint("body: ${json.encode(body)}");
        showPrint(jsonEncode(decoded));
      }
      if (decoded == null || decoded["status"] != "success") {
        // SentryFunction.capturingMessages(errorMessage: "$apiUrl  $decoded  $body");
      }
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
      showPrint(error.toString());
      // showPrint("token: ${Get.find<TokenServices>().fbIdToken}");
    }
    showPrint("##############################################################################################");
  }

  static void _goToTemporarilyUnavailableScreen({required Map<String, dynamic>? apiData}) {
    if (apiData != null) {
      showToast("TrKeys.pleaseContactAtSupportGiversHealth.name.tr", showToastInReleaseMode: true);
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Get.offAll(const IfSomethingWentWrongScreen());
    });
  }
}
