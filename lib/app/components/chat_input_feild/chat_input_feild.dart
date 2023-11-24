import 'package:flutter_boiler_plate/app/components/side_menu/views/widgets/on_hover_widget.dart';
import 'package:flutter_boiler_plate/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../styles/constants.dart';
import '../../styles/k_icons.dart';

class CustomChatInput extends StatefulWidget {
  late TextEditingController textController;
  final Function(String) onMessageSubmit;
  final Function() onSendTap;
  final Function() onAttachmentTap;
  final bool isAttachmentAvailable;

   CustomChatInput({super.key,
    required this.textController,
    required this.onMessageSubmit,
    required this.onSendTap,
    required this.onAttachmentTap,
    required this.isAttachmentAvailable,
  });

  @override
  State<CustomChatInput> createState() => _CustomChatInputState();
}

class _CustomChatInputState extends State<CustomChatInput> {

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
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(

              controller: widget.textController,
              focusNode: textFocus,
              decoration:  InputDecoration(
                suffixIcon: !widget.isAttachmentAvailable?null:OnHover(
                  builder: (isHovered) {
                    return IconButton(
                      icon: Transform.rotate(angle: 90 * 3.1415926535 / 180,
                      child: const Icon(Icons.attach_file)),
                      onPressed: widget.onAttachmentTap,
                      color:!isHovered?kColorGray.withOpacity(0.4): kColorMaroon,
                    );
                  }
                ),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: kColorMaroon.withOpacity(0.7)),
                // ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kColorMaroon),
                ),
                hintText: 'write the message',
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
              onSubmitted: widget.onMessageSubmit,
            )


          ),
        ),
        OnHover(
          builder: (isHovered) {
            final containerColor = isHovered ? kColorMaroonLight : kColorMaroon;
            final borderColor = isHovered ? kColorMaroon : Colors.transparent;

            return customInkWell(
              onTap: (){
                widget.onSendTap();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: containerColor,
                  border: Border.all(color: borderColor, width: 1), // Add border
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Transform.rotate(
                  angle: 325 * 3.1415926535 / 180,
                  child:  Icon(
                    Icons.send,
                    color: isHovered? kColorMaroon: kColorWhite,
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
