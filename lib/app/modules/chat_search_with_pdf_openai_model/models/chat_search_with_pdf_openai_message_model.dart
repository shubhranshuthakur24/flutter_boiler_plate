
class ChatSearchWithPdfOpenAIMessageModel {
  late final String message;
  late final String messageType;

  ChatSearchWithPdfOpenAIMessageModel(
      {
        required this.message,
        required this.messageType,
      });
}

enum EnumMessageStatus {
  sent,
  received,
}