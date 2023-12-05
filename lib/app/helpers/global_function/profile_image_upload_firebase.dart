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
    showPrint("printMessage from line 20");

    if (GetPlatform.isAndroid || GetPlatform.isWeb || GetPlatform.isIOS) {
      showPrint("printMessage from line 23");
      try {
        final firebaseStorage = FirebaseStorage.instance;
        showPrint("printMessage from line 26");
        if (true) {
          showPrint("printMessage from line 28");

          TaskSnapshot snapshot;
          if (GetPlatform.isWeb) {
            showPrint("printMessage from line 32");

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
          showPrint("printMessage from line 46");
          showPrint(downloadUrl.toString());
          showPrint(picName.toString());


          if (picName == "userProfilePic") {
            showPrint(" line 75");

            Get.find<TokenServices>().userProfileUrlUniversal.value = downloadUrl;
          }
        }
      } catch (error, stackTrace) {
        // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
      }
    }else{
      showPrint("printMessage line from 49");
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
