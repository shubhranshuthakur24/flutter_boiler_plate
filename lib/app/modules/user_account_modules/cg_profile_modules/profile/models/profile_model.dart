import 'package:get/get.dart';

class ProfileModel {
  ProfileModel({
    required this.cgDob,
    required this.cgFirstName,
    required this.lovedOneData,
    required this.cgLastName,
    required this.navigatorData,
    required this.assessmentStatus,
    required this.city,
    required this.myMantra,
    required this.state,
    required this.timezoneId,
    required this.careGiverId,
    required this.cgProfilePic,
    required this.phone,
    required this.email,
    required this.languageId,
    required this.zipcode,
    required this.languageName,
  });

  late final String cgDob;
  late final String cgFirstName;
  late final LovedOneData lovedOneData;
  late final String cgLastName;
  late final NavigatorData navigatorData;
  late final String assessmentStatus;
  late final String city;
  late final String myMantra;
  late final String state;
  RxInt timezoneId = 0.obs;
  late final int careGiverId;
  late final String cgProfilePic;
  late final String phone;
  late final String email;
  RxList<int> languageId = <int>[].obs;
  late final String zipcode;
  late final List<String> languageName;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    // cgDob = json['cg_dob'] ?? "";
    try {
      List dobList = json['cg_dob'].split("-");
      cgDob = dobList[dobList.length - 1] ?? "";
    } catch (error) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
      cgDob = "";
    }
    cgFirstName = (GetUtils.capitalize(json['cg_first_name'] ?? "")!);
    lovedOneData = LovedOneData.fromJson(json['loved_one_data']);
    cgLastName = (GetUtils.capitalize(json['cg_last_name'] ?? "")!);
    navigatorData = NavigatorData.fromJson(json['expert_group']);
    assessmentStatus = json['assessment_status'] ?? "";
    city = GetUtils.capitalize(json['city'] ?? "")!;
    myMantra = json['mymantra'];
    state = GetUtils.capitalize(json['state'] ?? "")!;
    timezoneId.value = json['timezoneid'];
    careGiverId = (json['care_giverid']);
    cgProfilePic = json['cg_profile_pic'] ?? "";
    phone = json['phone'] ?? "";
    email = json['email'];
    languageId.value = json['language_id'] == null ? [] : List.castFrom<dynamic, int>(json['language_id']);
    zipcode = json['zipcode'] ?? "";
    languageName = json['language_name'] == null ? [] : List.castFrom<dynamic, String>(json['language_name']);
  }
}

class LovedOneData {
  LovedOneData({
    required this.dob,
    required this.lastName,
    required this.lovedOneId,
    required this.firstName,
    // required this.ethnicityid,
    required this.lovedOneGender,
    required this.city,
    required this.state,
    required this.profilePicUrl,
  });

  late final String dob;
  late final String lastName;
  late final int lovedOneId;
  late final String firstName;

  late final String lovedOneGender;
  late final String city;
  late final String state;
  late final String profilePicUrl;

  LovedOneData.fromJson(Map<String, dynamic> json) {
    dob = json['dob'] ?? "";
    lastName = GetUtils.capitalize(json['last_name'] ?? "")!;
    lovedOneId = json['loved_oneid'];
    firstName = GetUtils.capitalize(json['first_name'] ?? "")!;

    lovedOneGender = json['loved_one_gender'] ?? "";
    city = json['city'] ?? "";
    state = json['state'] ?? "";
    profilePicUrl = json['profile_pic_url'] ?? "";
    // Get.find<TokenServices>().lovedOneProfileUrlUniversal.value = profilePicUrl;
  }
}

class NavigatorData {
  NavigatorData({
    required this.expertTeamid,
    required this.primaryExpertFirstName,
    required this.primaryExpertProfilePicUrl,
    required this.description,
  });

  late final int expertTeamid;
  late final String primaryExpertFirstName;
  late final String primaryExpertProfilePicUrl;
  late final String description;

  NavigatorData.fromJson(Map<String, dynamic> json) {
    expertTeamid = json['expert_teamid'];
    primaryExpertFirstName = json['primary_expert_first_name'] ?? "";
    primaryExpertProfilePicUrl = json['primary_expert_profile_pic_url'] ?? "";
    description = json['description'] ?? "";
  }
}
