import 'package:chat_app/app/components/side_menu/views/widgets/on_hover_widget.dart';
import 'package:chat_app/app/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../styles/constants.dart';
import '../../styles/k_icons.dart';

class CustomChatQueryInputField extends StatefulWidget {
  late TextEditingController textController;
  int ? maximumAllowedLines;


  CustomChatQueryInputField({super.key,
    required this.textController,
     this.maximumAllowedLines = 6,

  });

  @override
  State<CustomChatQueryInputField> createState() => _CustomChatQueryInputField();
}

class _CustomChatQueryInputField extends State<CustomChatQueryInputField> {

  final FocusNode textFocus = FocusNode();
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    textFocus.addListener(() {
      setState(() {
        isTyping = textFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    textFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      focusNode: textFocus,
      maxLines:widget.maximumAllowedLines,
      decoration:  InputDecoration(
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: kColorMaroon.withOpacity(0.7)),
        // ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kColorMaroon),
        ),
        hintText: 'write your query here .. ',
        hintStyle:  TextStyle(  // Set the hint text color
          color: isTyping ?  kColorMaroon: kColorGray.withOpacity(0.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kColorGray.withOpacity(0.4)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kColorMaroon),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kColorMaroon),
        ),
      ),
      cursorColor: kColorMaroon,
      // onSubmitted: widget.onMessageSubmit,
    );
  }
}
