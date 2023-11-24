
class ChatSearchWithCsvOpenAIMessageModel {
  late final String message;
  late final String messageType;

  ChatSearchWithCsvOpenAIMessageModel(
      {
        required this.message,
        required this.messageType,
      });
}

enum EnumNewMessageStatus {
  sent,
  received,
}