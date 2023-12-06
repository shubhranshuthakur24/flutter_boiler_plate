abstract class ApiEndpoints{
  static const _isPort = false;

  static const String baseUrl = _isPort == true
      ? "" // Place your development server url  on localhost with port no here.
      : "";// Place your production api url here.




  //
  // static const String loginApiUrl = "auth/login_user/";
  static const String signUpApiUrl = "${baseUrl}auth/signup/";
  static const String updateUserProfile = "${baseUrl}auth/update_user_profile/";
  static const String getUserProfile = "${baseUrl}auth/get_user_profile/";
  static get isPort => _isPort;

}
