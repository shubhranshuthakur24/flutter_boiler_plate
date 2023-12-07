import 'package:get/get_utils/src/get_utils/get_utils.dart';

class ProfileModel {
  ProfileModel({
    this.cgFirstName = "",
    this.cgLastName = "",
    this.cgProfilePic = "",
    this.email = "",
    this.age = "",
    this.dob = "",
    this.city = "",
  });

  late final String cgFirstName;
  late final String cgLastName;
  late final String cgProfilePic;
  late final String email;
  late final String age;
  late final String dob;
  late final String city;

  ProfileModel.fromJson(Map<String, dynamic>? json) {
    final userData = json?['user_data'];
    cgFirstName = GetUtils.capitalize(userData?['first_name']?.toString() ?? "")!;
    cgLastName = GetUtils.capitalize(userData?['last_name']?.toString() ?? "")!;
    cgProfilePic = userData?['profile_pic']?.toString() ?? "";
    email = userData?['email']?.toString() ?? "";
    age =  "32";
    dob =  "04-12-1998";
    city = "Delhi";
  }
}


