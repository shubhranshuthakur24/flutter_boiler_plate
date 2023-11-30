
import 'package:get/get.dart';

import '../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../styles/constants.dart';

class ProfileScreenServices extends GetxController {
  @override
  onInit() {
    super.onInit();
    apiGetUserProfile();
    // apiGetCgProfile();
    // apiGetCareGiverDetails();
  }
  Future<String> apiGetUserProfile() async {
    // await Get.find<TokenServices>().getAuthTokenFromFirebase();
    // // List<String> nameList = StringManipulation.nameSplit(fullname: name ?? firstNameController.text.trim());
    // Get.find<TokenServices>().careGiverFirstName = firstNameController.text.trim();
    // Get.find<TokenServices>().careGiverLastName = lastNameController.text.trim();
    // Get.find<TokenServices>().userProfileUrlUniversal.value = firebaseProfilePicUrl ?? "";
    String res = "";

    try {
      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(apiUrl: ApiEndpoints.getUserProfile,tokenRequired:true, body: {

        // if (firebaseToken != null) "firebase_id": firebaseToken,
      });
      showPrint(decoded.toString());
      // buttonPressed.value = false;

      if (decoded == null) return res;

      if (decoded["status"] == "success") {
        // Get.toNamed(ScreenNames.home.routeName);
        showPrint(decoded["data"].toString());
        // Get.find<TokenServices>().caregiverFirstName = firstNameController.text.trim();
        // Get.find<TokenServices>().upIdTypeIDModel.value =
        //     UpIdTypeModel(upIdTypeID: decoded["upid_type"], showCareRecipientAssessmentScreens: decoded["loved_one_active"]);
        // Get.offAll(() => const ThankYouForCrateAccountScreen());
        // loginApiHit();
        // _apiSelectLanguage(preferredLanguageMapping: selectedPreferredLanguageMapping);

      }
    } catch (error, stackTrace) {
      showToast(
          center: true,
          "Please Contact Support!",
          showToastInReleaseMode: true,
          iconAsset: "images/icons/infoRed.png",
          // toastBackGroundColor: kColorRedLight,
          duration: const Duration(seconds: 5));
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }

    hideLoading();
    return res;
  }
}