
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_ip_address/get_ip_address.dart';

import '../../../styles/constants.dart';
import '../../api_related_services/api_get_post_services.dart';
import '../../api_related_services/apis_endpoint.dart';

mixin IpAddressMixin {
  RxBool isIPAddressAPILoading = false.obs;
  RxString userIpAddress = "".obs;

  Future<String?>getUserIpAddress()async{
    try {
      var ipAddress = IpAddress(type: RequestType.text);
      dynamic userIpAddress = await ipAddress.getIpAddress();
      return userIpAddress;
      showPrint(userIpAddress.toString());
    } on IpAddressException catch (exception) {
      showPrint(exception.message);
    }
  }
  Future<void> apiPostUpdateLogin({required String userIpAddress}) async {
    isIPAddressAPILoading.value = true;
    try {
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
          tokenRequired: false,
          apiUrl: "",
          body:{
            "ip":userIpAddress,
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