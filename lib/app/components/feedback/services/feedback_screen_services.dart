import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FeedbackScreenServices extends GetxController  {
  RxDouble starRating = 0.0.obs;

  RxBool apiLoading = false.obs;
  final textController = TextEditingController();
  final focusNode = FocusNode();
  final scrollController = ScrollController();
  late RxList messageReceived = [].obs;
  late RxList messageSent = [].obs;
  late RxList<Widget> chatMessages = <Widget>[].obs;






  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
