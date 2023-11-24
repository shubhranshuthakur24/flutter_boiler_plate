import 'package:get/get.dart';

import '../../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../../routes/screen_names.dart';
import '../../../../../styles/constants.dart';
import '../../../../../utils/internationalization_using_getx/preferred_language_mapping.dart';
import '../models/profile_model.dart';


mixin MixinGetCgProfile {
  Rxn<ProfileModel> userScreenModel = Rxn();
  RxBool apiLoading = true.obs;

  Future<dynamic> apiGetCgProfile() async {
    // LocalDbServices.readApiDataInLocalDb(
    //     screenNameEnums: ScreenNames.menu, functionReferenceForStoreLocalDbDataInToDartVariable: apiDataStoreInDartVariable);
    dynamic res;
    Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.getMethod(apiUrl: ApiEndpoints.getProfileUrl);
    showPrint(decoded.runtimeType.toString());
    if (decoded == null) return;
    hideLoading();

    res = decoded;

    // LocalDbServices.saveApiDataInLocalDb(decodedResponse: decoded, screenNameEnums: ScreenNames.menu);
    apiDataStoreInDartVariable(decoded);
    // try {
    //   PreferredLanguageMapping? preferredLanguageMapping =
    //       preferredLanguageList.firstWhereOrNull((element) => element.languageId == userScreenModel.value?.languageId.first);
    //   if (preferredLanguageMapping != null) {
    //     await changeLanguageAndStoreInLocalDb(preferredLanguageMapping: preferredLanguageMapping);
    //   }
    // } catch (error) {}

    apiLoading.value = false;
    return res;
  }

  void apiDataStoreInDartVariable(Map<String, dynamic> decodedData) {
    userScreenModel.value = ProfileModel.fromJson(decodedData["data"]);
    apiLoading.value = false;
  }

  Future<dynamic> apiSelectLanguage({required PreferredLanguageMapping preferredLanguageMapping}) async {
    String languageIdString = "";
    for (int i in userScreenModel.value!.languageId) {
      languageIdString = "$languageIdString $i";
      languageIdString = languageIdString.trim();
    }
    // try {
    //   Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
    //       apiUrl: ApiEndpoints.selectLanguageUrl, body: {"languageid": languageIdString.trim()});
    //   if (decoded == null) return;
    //   await LocalDbServices.localDbDataClearForSpecificScreen(screenNameEnums: ScreenNames.menu);
    //   apiGetCgProfile();
    // } catch (error, stackTrace) {
    //   SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    // }
  }
}
