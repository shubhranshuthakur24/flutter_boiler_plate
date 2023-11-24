import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../styles/constants.dart';
import '../../api_related_services/api_get_post_services.dart';
import '../../api_related_services/apis_endpoint.dart';
import '../../global_models/chat_message_model.dart';

enum EnumMessageStatus {
  sent,
  received,
}
mixin ChatApiMixin {
  final focusNode = FocusNode();
  final scrollController = ScrollController();
  late RxList<ChatWithClaudeMessageModel> chatMessagesList = RxList<ChatWithClaudeMessageModel>();

  @override
  void handleEnterKey({required String apiUrlFromScreen, required RxBool isApiLoading, required String messageInput, required TextEditingController inputTextEditingController, required RxBool isFeedbackFormVisible}) {
    if (!isApiLoading.value) {
      apiGetChatData(sentMessages: messageInput, isApiLoading: isApiLoading, inputTextEditingController: inputTextEditingController, isFeedbackFormVisible: isFeedbackFormVisible, apiUrlFromScreen: apiUrlFromScreen);
    }
  }

  Future<void> apiGetChatData({required String apiUrlFromScreen,required RxBool isApiLoading,required String sentMessages, required TextEditingController inputTextEditingController, required RxBool isFeedbackFormVisible}) async {
    try {
      isFeedbackFormVisible.value = false;
      isApiLoading.value = true;
      inputTextEditingController.clear();
      ChatWithClaudeMessageModel sentMessage = ChatWithClaudeMessageModel(
        message: sentMessages,
        messageType: EnumMessageStatus.sent.name,
      );

      chatMessagesList.add(sentMessage);

      Map<String, dynamic>? decoded = await ApiGetPostMethodUniversal.postMethod(
        tokenRequired: false,
        apiUrl: apiUrlFromScreen,
        body: {"query": sentMessage.message},
      );

      if (decoded != null && decoded.containsKey("response")) {
        String receivedMessageFromApiResponse = decoded["response"];

        if (receivedMessageFromApiResponse.isNotEmpty) {
          // Create a MessageModel instance for the received message
          ChatWithClaudeMessageModel receivedMessage = ChatWithClaudeMessageModel(
            message: receivedMessageFromApiResponse,
            messageType: EnumMessageStatus.received.name,
          );

          chatMessagesList.add(receivedMessage);
          isApiLoading.value = false;
          Future.delayed(const Duration(seconds: 10), () {
            isFeedbackFormVisible.value = true;
          });
        }
      }
    } catch (error) {
      showPrint(error.toString());
    }
  }



  void loadChatMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? sentMessages = prefs.getStringList('sentMessages');
    List<String>? receivedMessage = prefs.getStringList('receivedMessage');
    if (sentMessages != null) {
      chatMessagesList.addAll(sentMessages.map((message) {
        return ChatWithClaudeMessageModel(
          message: message,
          messageType: EnumMessageStatus.sent.name,
        );
      }));
    }
    if (receivedMessage != null) {
      chatMessagesList.addAll(receivedMessage.map((message) {
        return ChatWithClaudeMessageModel(
          message: message,
          messageType: EnumMessageStatus.received.name,
        );
      }));
    }
  }

  void saveChatMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> messagesFromLocal = chatMessagesList.map((message) => message.message).toList();
    prefs.setStringList('messages', messagesFromLocal);
  }

  void addMessage({required String sentMessages, required String receivedMessage}) {
    chatMessagesList.add(ChatWithClaudeMessageModel(
      message: sentMessages,
      messageType: EnumMessageStatus.sent.name,
    ));

    chatMessagesList.add(ChatWithClaudeMessageModel(
      message: receivedMessage,
      messageType: EnumMessageStatus.received.name,
    ));
  }
}
