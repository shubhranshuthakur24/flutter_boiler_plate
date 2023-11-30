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
          headers: ({"Authorization": "Token eyJhbGciOiJSUzI1NiIsImtpZCI6IjAzZDA3YmJjM2Q3NWM2OTQyNzUxMGY2MTc0ZWIyZjE2NTQ3ZDRhN2QiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZ3ZoZWFsdGgtd2ViIiwiYXVkIjoiZ3ZoZWFsdGgtd2ViIiwiYXV0aF90aW1lIjoxNjk1ODc5OTg2LCJ1c2VyX2lkIjoiTWVQZzN0aHlVZ1JlTkh0Yzl2NzhFbHE4cG1pMSIsInN1YiI6Ik1lUGczdGh5VWdSZU5IdGM5djc4RWxxOHBtaTEiLCJpYXQiOjE2OTc4NjUyMzEsImV4cCI6MTY5Nzg2ODgzMSwiZW1haWwiOiJ0ZXN0YWNjc2h1YmgxMDErMTExQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0YWNjc2h1YmgxMDErMTExQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.IVxjO2Dvt5Kxi49xMU_bIcNDu-Fm9yTZTJbCaO7lUg8o-vYtM8sZCcVCja5nVkYByeJLEhZq1s4Btb-Wq0R5UUnxoHtHxUcwMKgpFH4nf0vzwLaqgfZO9KbVsLX3sVs-kE87mizd_eja4Y2f1WFZ4aDhZ6k5OOnhYQK5fCZNcJBFmAXKR9nIn9KmmXzhoEkePL-u49ZjKf_rZSTtsJHXpO8vkh2fBC5TLJDVE8bj7TCfVqNUu-R_XIKfHse-34sVSdDUwhHL9otlTixycML-XABpD8_xWYdNLWUzkdoij879K6BjKF2XAAh-gJ0L7hEbaoUMEtvV75VYejSPFS5jeQ"}));
      if (httpResponse.statusCode == 200) {
      } else if (httpResponse.statusCode == 401) {
        // await Get.find<TokenServices>().getAuthTokenFromFirebase();
        httpResponse = await http.get(Uri.parse(apiUrl),
            headers: ({"Authorization": "Token eyJhbGciOiJSUzI1NiIsImtpZCI6IjAzZDA3YmJjM2Q3NWM2OTQyNzUxMGY2MTc0ZWIyZjE2NTQ3ZDRhN2QiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZ3ZoZWFsdGgtd2ViIiwiYXVkIjoiZ3ZoZWFsdGgtd2ViIiwiYXV0aF90aW1lIjoxNjk1ODc5OTg2LCJ1c2VyX2lkIjoiTWVQZzN0aHlVZ1JlTkh0Yzl2NzhFbHE4cG1pMSIsInN1YiI6Ik1lUGczdGh5VWdSZU5IdGM5djc4RWxxOHBtaTEiLCJpYXQiOjE2OTc4NjUyMzEsImV4cCI6MTY5Nzg2ODgzMSwiZW1haWwiOiJ0ZXN0YWNjc2h1YmgxMDErMTExQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0YWNjc2h1YmgxMDErMTExQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.IVxjO2Dvt5Kxi49xMU_bIcNDu-Fm9yTZTJbCaO7lUg8o-vYtM8sZCcVCja5nVkYByeJLEhZq1s4Btb-Wq0R5UUnxoHtHxUcwMKgpFH4nf0vzwLaqgfZO9KbVsLX3sVs-kE87mizd_eja4Y2f1WFZ4aDhZ6k5OOnhYQK5fCZNcJBFmAXKR9nIn9KmmXzhoEkePL-u49ZjKf_rZSTtsJHXpO8vkh2fBC5TLJDVE8bj7TCfVqNUu-R_XIKfHse-34sVSdDUwhHL9otlTixycML-XABpD8_xWYdNLWUzkdoij879K6BjKF2XAAh-gJ0L7hEbaoUMEtvV75VYejSPFS5jeQ"}));
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
      var headers = tokenRequired?{
        'Content-Type': 'application/json',
        'Authorization': "Token ${Get.find<TokenServices>().idToken}",
      }:{
        'Content-Type': 'application/json',
      };

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
