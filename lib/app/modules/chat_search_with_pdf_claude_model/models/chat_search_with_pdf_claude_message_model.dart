
class ChatSearchWithPdfClaudeMessageModel {
  late final String message;
  late final String messageType;

  ChatSearchWithPdfClaudeMessageModel(
      {
        required this.message,
        required this.messageType,
      });
}

enum EnumMessageStatus {
  sent,
  received,
}