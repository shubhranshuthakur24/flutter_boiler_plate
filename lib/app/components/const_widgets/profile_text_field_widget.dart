import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/colors.dart';
import '../../styles/font_styles.dart';
import 'change_with_image_widget.dart';

class ProfileTextFieldsWidget extends StatelessWidget {
  String type;
  String? assestImageName;
  TextEditingController textEditingController;
  final int? maxInputCharLength;
  final Color textColor;

  ProfileTextFieldsWidget(
      {super.key,
        required this.type,
        required this.textEditingController,
        this.maxInputCharLength,
        this.textInputFormatter,
        this.assestImageName,
        this.textColor = kColorBlack});

  List<TextInputFormatter>? textInputFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: kColorWhite, borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 013, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              assestImageName == null
                  ? const SizedBox.shrink()
                  : const SizedBox(
                width: 20,
                height: 20,
                child: ChangeThisWidgetWithImage(),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                type,
                style: kFontNotoSansS18W400Para1.copyWith(color: kColorGray),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            style: kFontNotoSansS18W400Para1.copyWith(color: textColor),
            inputFormatters: textInputFormatter,
            maxLines: null,
            controller: textEditingController,
            cursorColor: kColorBlueDark,
            maxLength: maxInputCharLength,
            decoration: InputDecoration(
                errorMaxLines: 2,
                hintStyle: kFontNotoSansS18W400Para1.copyWith(color: kColorGray),
                isDense: true,
                contentPadding: const EdgeInsets.only(bottom: 5),
                counterText: "",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: const UnderlineInputBorder(borderSide: BorderSide(color: kColorBlueDark)),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kColorBlueDark)),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kColorGrayLight))),
          ),
        ],
      ),
    );
  }
}
