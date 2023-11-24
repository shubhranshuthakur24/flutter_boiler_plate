
class ChatSearchWithCsvClaudeMessageModel {
  late final String message;
  late final String messageType;

  ChatSearchWithCsvClaudeMessageModel(
      {
        required this.message,
        required this.messageType,
      });
}

enum EnumMessageStatus {
  sent,
  received,
}