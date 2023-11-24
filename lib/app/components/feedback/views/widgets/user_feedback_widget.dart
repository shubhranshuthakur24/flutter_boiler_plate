import 'package:chat_app/app/components/side_menu/views/widgets/on_hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/font_styles.dart';

class UserFeedbackWidget extends StatefulWidget {
  const UserFeedbackWidget({
    super.key,
    required this.responsesList,
    required this.onSelectionChanged, // Callback for notifying selection changes
  });

  final RxList<String> responsesList;
  final Function(Set<String>) onSelectionChanged; // Callback for notifying selection changes

  @override
  _UserFeedbackWidgetState createState() => _UserFeedbackWidgetState();
}

class _UserFeedbackWidgetState extends State<UserFeedbackWidget> {
  final Set<String> selectedItems = <String>{};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0, // Add spacing between items
      children: widget.responsesList.map((item) {
        final text = item;
        final textLength = text.length;
        final containerWidth = 80.0 + (textLength * 6.0);
        final isSelected = selectedItems.contains(item);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedItems.remove(item);
              } else {
                selectedItems.add(item);
              }
              widget.onSelectionChanged(selectedItems); // Notify of selection change
            });
          },
          child: OnHover(
            builder: (onHover) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10), // Add margin at the bottom
                width: containerWidth,
                height: 31,
                decoration: ShapeDecoration(
                  color: kColorMaroonLight,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: isSelected || onHover ? kColorMaroon : kColorGray.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    item,
                    style: kFontNotoSans.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: isSelected || onHover ? kColorMaroon : kColorBlack,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
