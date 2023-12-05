import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../styles/constants.dart';
import '../token_services/token_services.dart';

mixin ProfileImageUploadFirebase {
  final picker = ImagePicker();

  Future<void> uploadImage({
    required String picName,
    required var file,
  }) async {
    try {
      final firebaseStorage = FirebaseStorage.instance;
      final userId = Get.find<TokenServices>().userId;
      final imagePath = 'media/$userId/images/$picName';

      TaskSnapshot snapshot;

      if (GetPlatform.isWeb) {
        snapshot = await firebaseStorage.ref().child(imagePath).putData(file);
      } else {
        snapshot = await firebaseStorage.ref().child(imagePath).putFile(file);
      }

      var downloadUrl = await snapshot.ref.getDownloadURL();
      showPrint("Download URL: $downloadUrl");

      if (picName == "userProfilePic") {
        Get.find<TokenServices>().userProfileUrlUniversal.value = downloadUrl;
      }
    } catch (error, stackTrace) {
      showPrint("Error uploading image: $error");
      // Handle error or log it using your preferred error handling mechanism
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
  }
}
