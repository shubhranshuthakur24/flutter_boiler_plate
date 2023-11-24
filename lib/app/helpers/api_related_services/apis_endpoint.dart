abstract class ApiEndpoints{
  static const _isPort = false;

  static const String baseUrl = _isPort == true
      ? "http://api1llm.hub9.io/"
      : "https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/llm/";
  // : "http://192.168.0.102:8000/v1/";


  static const String loginApiUrl = "auth/login_user/";
  static const String resetPassword = "auth/login_user/";
  static const String requestResetPassword = "auth/login_user/";
  static const String signUpApiUrl = "auth/signup_user/";
  static const String otpCheckUrl = "auth/post_verify_reset_otp/";

  // static String simpleChat = "${baseUrl}simple_chat/";
  // static String searchWithVectorDb = "${baseUrl}search_with_vector_db/";
  static const String searchWithPdfClaudeModel = "${baseUrl}search_with_pdf_claude_model/";
  static const String searchWithPdfOpenaiModel = "${baseUrl}search_with_pdf_openai_model/";
  static const String simpleChatWithClaudeModel = "${baseUrl}simple_chat_with_claude_model/";
  static const String searchWithCsvClaudeModel = "${baseUrl}search_with_csv_claude_model/";
  static const String searchWithCsvOpenaiModel = "${baseUrl}search_with_csv_openai_model/";
  static const String feedbackResponse = "https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/auth/update_users_feedback/";
  static const String updateLogin = "https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/auth/update_login/";
  static const String generateSummeryFromPdf = "https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/lIm/generate_summery_from_pdf/";
  static const String getProfileUrl = "";
  static const String userDetailsApiUrl = "";

  // https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/llm/search_with_pdf_claude_model/
  // https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/llm/search_with_pdf_openai_model/
  // https://3xiyi3pnn7.us-east-1.awsapprunner.com//v1/llm/simple_chat_with_claude_model/
  // https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/llm/search_with_csv_claude_model/
  // https://3xiyi3pnn7.us-east-1.awsapprunner.com/v1/llm/search_with_csv_openai_model/
  static get isPort => _isPort;
// static String get loginApiUrl => _loginApiUrl;
// static String get resetPassword => _resetPassword;
// static String get requestResetPassword => _requestResetPassword;
// static String get signUpApiUrl => _signUpApiUrl;
}
