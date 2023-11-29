abstract class ApiEndpoints{
  static const _isPort = false;

  static const String baseUrl = _isPort == true
      ? "http://api1llm.hub9.io/"
      : "https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/";


  static const String resetPassword = "auth/login_user/";
  static const String requestResetPassword = "auth/login_user/";
  static const String otpCheckUrl = "auth/post_verify_reset_otp/";
  //
  static const String loginApiUrl = "auth/login_user/";
  static const String signUpApiUrl = "auth/signup/";
  static const String updateUserProfile = "auth/post_verify_reset_otp/";
  static const String getUserProfile = "auth/get_user_profile/";
  static const String updateLogin = "https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/auth/update_login/";
  static const String feedbackResponse = "https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/auth/update_users_feedback/";

  static get isPort => _isPort;

}
