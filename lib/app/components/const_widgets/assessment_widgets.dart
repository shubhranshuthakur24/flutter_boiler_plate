import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/global_function/string_manipulation.dart';
import '../../styles/colors.dart';
import '../../styles/constants.dart';
import '../../styles/font_styles.dart';

class CustomTextFieldForZipCode extends StatefulWidget {
  final String labelText;
  final GestureTapCallback tap;
  final TextEditingController textEditingController;
  final controller;

  const CustomTextFieldForZipCode(
      {super.key, required this.labelText, required this.tap, required this.textEditingController, required this.controller});

  @override
  State<CustomTextFieldForZipCode> createState() => _CustomTextFieldForZipCodeState();
}

class _CustomTextFieldForZipCodeState extends State<CustomTextFieldForZipCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: TextField(
        style: kFontNotoSans.copyWith(fontWeight: FontWeight.w400, fontSize: 18),
        keyboardAppearance: Brightness.light,
        onChanged: (text) {
          widget.controller.textValidation();
        },
        maxLength: 5,
        controller: widget.textEditingController,
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onTap: widget.tap,
        showCursor: true,
        cursorColor: kColorBlueDark,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          errorMaxLines: 2,
          contentPadding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
          counterText: "",
          filled: true,
          fillColor: kColorWhite,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: const TextStyle(color: Colors.black38),
          floatingLabelStyle: const TextStyle(color: kColorBlack),
          labelStyle: const TextStyle(color: Colors.black38, fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kColorBlueDark, width: 2),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(kBorderRadius), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class CustomTextFieldForYearOfBirth extends StatefulWidget {
  final String labelText;
  final GestureTapCallback tap;
  final controller;

  CustomTextFieldForYearOfBirth(
      {super.key, required this.labelText, required this.tap, required this.controller, this.textEditingController});

  TextEditingController? textEditingController;

  @override
  State<CustomTextFieldForYearOfBirth> createState() => _CustomTextFieldForYearOfBirthState();
}

class _CustomTextFieldForYearOfBirthState extends State<CustomTextFieldForYearOfBirth> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // constraints: const BoxConstraints(maxWidth: 430, maxHeight: 60),
      width: double.infinity,
      // height: 60,
      child: TextField(
        style: kFontNotoSans.copyWith(fontWeight: FontWeight.w400, fontSize: 18),
        keyboardAppearance: Brightness.light,
        onChanged: (text) {
          widget.controller.textValidation();
        },
        maxLength: 4,
        controller: widget.textEditingController,
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onTap: widget.tap,
        showCursor: true,
        cursorColor: kColorBlueDark,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          errorMaxLines: 2,
          contentPadding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
          counterText: "",
          filled: true,
          fillColor: kColorWhite,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          // labelText: widget.labelText,
          // hintText: "Year of birth",
          hintStyle: const TextStyle(color: Colors.black38),
          floatingLabelStyle: const TextStyle(color: kColorBlack),
          labelStyle: const TextStyle(color: Colors.black38, fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kColorBlueDark, width: 2),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldForPhoneNo extends StatefulWidget {
  final String labelText;
  final GestureTapCallback tap;
  final controller;
  TextEditingController? textEditingController;

  CustomTextFieldForPhoneNo({Key? key, required this.labelText, required this.tap, this.controller, this.textEditingController})
      : super(key: key);

  @override
  State<CustomTextFieldForPhoneNo> createState() => _CustomTextFieldForPhoneNoState();
}

class _CustomTextFieldForPhoneNoState extends State<CustomTextFieldForPhoneNo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 430, maxHeight: 60),
      width: double.infinity,
      height: 60,
      child: TextField(
        keyboardAppearance: Brightness.light,
        onChanged: (text) {
          widget.controller.textValidation();
        },
        maxLength: 12,
        controller: widget.textEditingController,
        keyboardType: TextInputType.datetime,
        inputFormatters: [StringManipulation.maskTextInputFormatter],
        onTap: widget.tap,
        showCursor: true,
        cursorColor: kColorBlueDark,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          errorMaxLines: 2,
          contentPadding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
          counterText: "",
          filled: true,
          fillColor: kColorWhite,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          // labelText: widget.labelText,
          // hintText: "Year of birth",
          hintStyle: const TextStyle(color: Colors.black38),
          floatingLabelStyle: const TextStyle(color: kColorBlack),
          labelStyle: const TextStyle(color: Colors.black38, fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kColorBlueDark, width: 2),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
        ),
      ),
    );
  }
}
