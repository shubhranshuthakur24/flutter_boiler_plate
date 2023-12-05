import 'package:get/get_utils/src/get_utils/get_utils.dart';

class ProfileModel {
  ProfileModel({
    this.cgFirstName = "",
    this.cgLastName = "",
    this.cgProfilePic = "",
    this.email = "",
  });

  late final String cgFirstName;
  late final String cgLastName;
  late final String cgProfilePic;
  late final String email;

  ProfileModel.fromJson(Map<String, dynamic>? json) {
    final userData = json?['user_data'];
    cgFirstName = GetUtils.capitalize(userData?['first_name']?.toString() ?? "")!;
    cgLastName = GetUtils.capitalize(userData?['last_name']?.toString() ?? "")!;
    cgProfilePic = userData?['profile_pic']?.toString() ?? "";
    email = userData?['email']?.toString() ?? "";
  }
}


