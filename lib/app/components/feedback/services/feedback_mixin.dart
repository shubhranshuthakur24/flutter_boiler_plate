import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../helpers/token_services/token_services.dart';
import '../../../styles/constants.dart';

mixin MixinFeedbackResponse {
  RxInt starRating = 0.obs;
  final RxString responseToSend = "".obs;
  late  RxString userIpAddress = "".obs;
  RxList<String> responsesList = <String>["frustrating","quick response","efficient support","helpful information",].obs;
  // RxList<ChatWithClaudeMessageModel> chatMessagesList = RxList<ChatWithClaudeMessageModel>();
  RxBool apiFeedbackResponseLoading = false.obs;
  RxBool showResponseRecordedDialog = false.obs;


  // Future<String?>getUserIpAddress()async{
  //   try {
  //     var ipAddress = IpAddress(type: RequestType.text);
  //     dynamic data = await ipAddress.getIpAddress();
  //     userIpAddress.value = data;
  //     showPrint(data.toString());
  //   } on IpAddressException catch (exception) {
  //     showPrint(exception.message);
  //   }
  // }

  String getStringBasedOnStarRating(int input) {
    switch (input) {
      case 1:
        return "We're sorry to hear you had a poor experience. Please tell us what went wrong";
      case 2:
        return "Thank you for your feedback. Can you provide more details on what made it a fair experience?";
      case 3:
        return "We're glad you found it good! What could we do to make it even better next time?";
      case 4:
        return "Your 4 - star rating indicates a very good experience. What aspects did you like most?";
      case 5:
        return 'Wow, thanks for the excellent rating! What made this chat experience excellent for you?';
      default:
        return "Click on the stars to select your rating. Your feedback is important to us.";
    }
  }


  Future<void> apiPostFeedbackResponse({required String ipAddress, required String userRating, required String comment}) async {
    try {
      apiFeedbackResponseLoading.value =true;
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
          apiUrl: ApiEndpoints.feedbackResponse,
          body:{
            "ip":ipAddress,
            "users_rating":userRating,
            "cmnt":comment
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
      apiFeedbackResponseLoading.value = false;


    } catch (error) {
      showPrint(error.toString());
    }
  }


}