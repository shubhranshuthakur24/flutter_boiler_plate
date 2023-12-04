import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../../../../../helpers/api_related_services/api_get_post_services.dart';
import '../../../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../../../helpers/token_services/token_services.dart';
import '../../../../../styles/constants.dart';
import '../../profile/models/profile_model.dart';
import '../../profile/services/mixin_get_cg_profile.dart';

class ProfileUpdateServices extends GetxController with MixinGetCgProfile{
  bool hasAnythingChanged = false;
  // final MenuServices userBioServicesController = Get.find();
  // final ProfileImageUploadFirebase _profileImageUploadFirebase = Get.put(ProfileImageUploadFirebase());
  late String cgZipcode;
  late String dob;
  late String cgFirstName;
  late String cgLastName;
  late String cgEmail;
  late String cgContactDetails;
  late TextEditingController cgFullNameEditingController;
  late TextEditingController cgEmailEditingController;
  final picker = ImagePicker();
  var image;
  var file;
  Uint8List webImage = Uint8List(10);
  File fileForWeb = File("zz");

  // bool isPreviousScreenIsHome = false;

  @override
  onInit() {
    super.onInit();
    apiGetCgProfile();


    // try {
    //   List dobList = userScreenModel.value!.cgDob.split("-");
    //   dob = dobList[dobList.length - 1] ?? "";
    // } catch (error, stackTrace) {
    //   // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    //   dob = "";
    // }
    showPrint("printMessage");
    showPrint(userScreenModel.value.toString());

    // dob = "04-06-2004";
    if(userScreenModel.value != null){
      cgFirstName = userScreenModel.value?.cgFirstName ?? "" ;
      cgLastName = userScreenModel.value?.cgLastName ?? "";
      cgEmail = userScreenModel.value!.email;
    }else{
      cgFirstName =  "" ;
      cgLastName = "";
      cgEmail = "";
    }

    // cgZipcode = "452010";
    // cgZipcodeEditingController = TextEditingController(text: cgZipcode);
    // cgFullNameEditingController = TextEditingController(text: "$cgFirstName $cgLastName");
    cgEmailEditingController = TextEditingController(text: cgEmail);
    // cgDobEditingController = TextEditingController(text: dob);
    // cgMantraController = TextEditingController(text: "userBioServicesController.userScreenModel.value!.myMantra");
    // cgContactDetails = "8943892332";
    // cgContactDetailsEditingController = TextEditingController(text: cgContactDetails);
  }

  @override
  void onClose() {
    super.onClose();
    // Get.find<MenuServices>().apiGetCgProfile();
  }

  void cgProfileUpdate() {
    showLoading(title: "Saving ...");
    if (cgFullNameEditingController.text.trim().isEmpty) {
      showToast("Please Enter Name", showToastInReleaseMode: true);
      hideLoading();
      return;
    }
    // if (cgMantraController.text.trim().isEmpty) {
    //   showToast("Please enter mantra", showToastInReleaseMode: true);
    //   hideLoading();
    //   return;
    // }
    // if (cgZipcodeEditingController.text.trim().length < 5 || !GetUtils.isNum(cgZipcodeEditingController.text.trim())) {
    //   if (cgZipcodeEditingController.text.trim().isEmpty) {
    //     showToast("Zip Code Can't Be Empty", showToastInReleaseMode: true);
    //   } else {
    //     showToast("Please Enter Valid Zip Code ", showToastInReleaseMode: true);
    //   }
    //
    //   hideLoading();
    //   return;
    // }
    // if (!true(dobYear: cgDobEditingController.text.trim())) {
    //   if (cgDobEditingController.text.trim().isEmpty) {
    //     showToast(TrKeys.pleaseEnterYourValidYearOfBirth.name.tr, showToastInReleaseMode: true);
    //   } else {
    //     showToast(TrKeys.pleaseEnterYourValidYearOfBirth.name.tr, showToastInReleaseMode: true);
    //   }
    //   hideLoading();
    //   return;
    // }
    if (GetPlatform.isWeb) {
      // if (fileForWeb.path == "zz") {
      //   apiUpdateUserDetailsWithImage(
      //     zipcode: cgZipcodeEditingController.text,
      //     dob: cgDobEditingController.text,
      //     contactNumber: cgContactDetailsEditingController.text,
      //   );
      // } else {
      //   // _profileImageUploadFirebase.uploadImage(picName: "cgProfilePic", file: webImage).then((value) {
      //   //   apiUpdateUserDetailsWithImage(
      //   //     zipcode: cgZipcodeEditingController.text,
      //   //     dob: cgDobEditingController.text,
      //   //     contactNumber: cgContactDetailsEditingController.text,
      //   //   );
      //   // });
      // }
    } else {
      if (image == null) {
        // apiUpdateUserDetailsWithImage(
        //   zipcode: cgZipcodeEditingController.text,
        //   dob: cgDobEditingController.text,
        //   contactNumber: cgContactDetailsEditingController.text,
        // );
      } else {
        // _profileImageUploadFirebase.uploadImage(picName: "cgProfilePic", file: file).then((value) {
        //   apiUpdateUserDetailsWithImage(
        //     zipcode: cgZipcodeEditingController.text,
        //     dob: cgDobEditingController.text,
        //     contactNumber: cgContactDetailsEditingController.text,
        //   );
        // }
        // );
      }
    }
  }

  Future<String> apiUpdateUserDetailsWithImage(
      {required String zipcode, required String dob, required String contactNumber}) async {
    String res = "";
    showPrint("printMessage");
    // if (cgContactDetailsEditingController.text.trim() == "") showPrint("hello");

    // List<String> splitNameList = StringManipulation.nameSplit(fullname: cgFullNameEditingController.text.trim());
    Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(apiUrl: ApiEndpoints.updateUserProfile, body: {
      "profile_picurl": Get.find<TokenServices>().userProfilePictureUrl.value.trim(),
      "firstname": "splitNameList[0].trim().toLowerCase()",
      "lastname": "splitNameList[1].trim().toLowerCase()",
      "zipcode": zipcode.trim(),
      if (GetUtils.isNum(dob.trim())) "dob": dob.trim(),
      // if (GetUtils.isNum(cgContactDetailsEditingController.text.trim().replaceAll("-", "")) ||
      //     cgContactDetailsEditingController.text.trim().isEmpty)
      //   "contact_details": cgContactDetailsEditingController.text.trim(),
    });

    if (decoded == null) return res;

    if (Get.isDialogOpen == true) {
      hideLoading();
      Get.back();
    }

    hasAnythingChanged = true;

    return res;
  }
  static String ageCalculator(String dob) {
    String age = "";
    try {
      var dobSplit = dob.split("-");
      age = (DateTime.now().year.toInt() - int.parse(dobSplit.last)).toString();
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
    return age.toString();
  }
}
