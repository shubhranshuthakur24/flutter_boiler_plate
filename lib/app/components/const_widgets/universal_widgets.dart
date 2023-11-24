import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/colors.dart';
import '../../styles/constant_font_size.dart';
import '../../styles/constants.dart';

class LogInTextFields extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  var controller;
  GlobalKey<FormState>? formKey;
  var voidCallback;
  final int? maxLength;

  LogInTextFields(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.textEditingController,
      required this.controller,
      this.formKey,
      this.voidCallback,
      this.maxLength});

  @override
  State<LogInTextFields> createState() => _LogInTextFieldsState(maxLength: maxLength);
}

class TextFieldTittle extends StatefulWidget {
  String textFildTittle;

  TextFieldTittle({super.key, required this.textFildTittle});

  @override
  _TextFieldTittleState createState() => _TextFieldTittleState();
}

class _LogInTextFieldsState extends State<LogInTextFields> {
  bool onSelected = false;
  final int? maxLength;

  _LogInTextFieldsState({this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      // // width: 327,
      margin: const EdgeInsets.only(bottom: 9),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          validator: (value) {
            return widget.voidCallback();
          },
          keyboardAppearance: Brightness.light,
          onChanged: (value) {
            widget.controller.textFieldValidation();
            if (GetUtils.isLengthGreaterThan(value, maxLength ?? 34)) {}
          },
          maxLength: maxLength ?? 34,
          controller: widget.textEditingController,
          showCursor: true,
          cursorColor: kColorBlueDark,
          textDirection: TextDirection.ltr,
          autofocus: true,
          decoration: InputDecoration(
            errorMaxLines: 2,
            hoverColor: kColorWhite,
            border: InputBorder.none,
            counterText: "",
            filled: true,
            fillColor: kColorWhite,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kColorMaroon, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: kColorMaroon.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextFieldTittleState extends State<TextFieldTittle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 0, bottom: 7),
          child: Text(
            widget.textFildTittle,
            style: TextStyle(fontFamily: constantLato, fontSize: 15, fontWeight: FontWeight.w400, color: kColorBlack),
          ),
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  var controller;
  GlobalKey<FormState>? formKey;
  var voidCallback;

  PasswordTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.textEditingController,
      required this.controller,
      this.formKey,
      this.voidCallback});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool onSelected = false;
  bool obscureTextPassword = true;
  Color colorPasswordEye = kColorMaroon.withOpacity(0.6);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 327,
      margin: const EdgeInsets.only(bottom: 9),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          obscureText: obscureTextPassword,
          validator: (value) {
            return widget.voidCallback();
          },
          keyboardAppearance: Brightness.light,
          onChanged: (value) {
            widget.controller.textFieldValidation();
            if (GetUtils.isLengthGreaterThan(value, 33)) {}
          },
          maxLength: 34,
          controller: widget.textEditingController,
          showCursor: true,
          cursorColor: kColorBlueDark,
          textDirection: TextDirection.ltr,
          autofocus: true,
          decoration: InputDecoration(
            errorMaxLines: 2,
            suffixIcon: TextButton(
                onPressed: () {
                  setState(() {
                    if (obscureTextPassword == false) {
                      obscureTextPassword = true;
                      colorPasswordEye = kColorMaroon.withOpacity(0.6);
                    } else {
                      obscureTextPassword = false;
                      colorPasswordEye = kColorMaroon;
                    }
                  });
                },
                child: Icon(
                  CupertinoIcons.eye,
                  color: colorPasswordEye,
                )),
            hoverColor: kColorWhite,
            border: InputBorder.none,
            counterText: "",
            filled: true,
            fillColor: kColorWhite,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kColorMaroon, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: kColorMaroon.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class PurpleButton extends StatelessWidget {
  PurpleButton({super.key, required this.text, required this.press, this.buttonColor, this.buttonStyle});

  Color? buttonColor = kColorBlueDark;
  final String text;
  final TextStyle? buttonStyle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 55,
      minWidth: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
      splashColor: kColorMaroon,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      color: buttonColor,
      onPressed: press,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: buttonStyle ?? kButtonTextStyle1(),
      ),
    );
  }
}

class PurpleButtonDesktop extends StatelessWidget {
  const PurpleButtonDesktop({super.key, required this.text, required this.press});

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: MaterialButton(
        elevation: 0,
        height: 45,
        padding: const EdgeInsets.only(left: 10, right: 10),
        splashColor: kColorBlueDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: kColorBlueDark, width: 2.2),
        ),
        color: kColorBlueDark,
        onPressed: press,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: kButtonTextStyle1(),
        ),
      ),
    );
  }
}
