import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_boiler_plate/app/styles/constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../token_services/token_services.dart';

mixin ProfileImageUploadFirebase {
  final picker = ImagePicker();

  Future uploadImage({required String picName, required var file}) async {
    //

    //

    //

    //

    if (GetPlatform.isAndroid || GetPlatform.isWeb || GetPlatform.isIOS) {
      try {
        final firebaseStorage = FirebaseStorage.instance;
        if (true) {

          TaskSnapshot snapshot;
          if (GetPlatform.isWeb) {

            snapshot = await firebaseStorage
                .ref()
                .child('media/' + Get.find<TokenServices>().userId + "/images/" + picName)
                .putData(file);
          } else {
            snapshot = await firebaseStorage
                .ref()
                .child('media/' + Get.find<TokenServices>().userId + "/images/" + picName)
                .putFile(file);
          }
          var downloadUrl = await snapshot.ref.getDownloadURL();
          showPrint(downloadUrl.toString());
          showPrint(picName.toString());


          if (picName == "userProfilePic") {
            Get.find<TokenServices>().userProfileUrlUniversal.value = downloadUrl;
          }
        }
      } catch (error, stackTrace) {
        // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
      }
    }else{
      try {
        final firebaseStorage = FirebaseStorage.instance;

        if (true) {
          TaskSnapshot snapshot;
          if (GetPlatform.isWeb) {
            snapshot = await firebaseStorage
                .ref()
                .child("${'media/' + Get.find<TokenServices>().userId}/images/$picName")
                .putData(file);
          } else {
            snapshot = await firebaseStorage
                .ref()
                .child("${'media/' + Get.find<TokenServices>().userId}/images/$picName")
                .putFile(file);
          }
          var downloadUrl = await snapshot.ref.getDownloadURL();
          if (picName == "userProfilePic") {
            Get.find<TokenServices>().userProfileUrlUniversal.value = downloadUrl;
          }
        } else {}
      } catch (error, stackTrace) {
        // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
      }
    }
  }
}
