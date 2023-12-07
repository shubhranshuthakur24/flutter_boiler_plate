
import 'package:flutter_boiler_plate/app/helpers/token_services/token_services.dart';
import 'package:get/get.dart';
import '../../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../../styles/constants.dart';
import '../models/profile_model.dart';

mixin MixinGetCgProfile {
  final Rxn<ProfileModel> userScreenModel = Rxn();
  final RxBool apiLoading = false.obs;
  // var user_data;


  Future<dynamic> apiGetCgProfile() async {

    try {
      Map<String, dynamic>? decoded =
      await ApiGetPostMethodUniversal.getMethod(apiUrl: ApiEndpoints.getUserProfile);


      if (decoded == null) {
        // Handle the case when there's no data
        return null;
      }

      if (decoded.containsKey('status') && decoded['status'] == 'success') {
        userScreenModel.value = ProfileModel.fromJson(decoded);
        Get.find<TokenServices>().userProfileUrlUniversal.value = userScreenModel.value!.cgProfilePic;
        return userScreenModel;
      }

      showPrint(decoded.runtimeType.toString());
      // showPrint("decoded.runtimeType.toString()");


      hideLoading();

      apiLoading.value = false;
      return decoded;
    } catch (error) {
      // Handle the error, e.g., show an error message
      showPrint('Error: $error');
      return null;
    }
  }


}

