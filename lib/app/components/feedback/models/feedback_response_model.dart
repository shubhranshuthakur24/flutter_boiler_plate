class FeedbackResponseModel {
  late final String message;
  late final String messageType;

  FeedbackResponseModel(
      {
        required this.message,
        required this.messageType,
      });
}

enum EnumMessageStatus {
  sent,
  received,
}