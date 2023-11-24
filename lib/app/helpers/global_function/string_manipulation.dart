import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../styles/colors.dart';

abstract class StringManipulation {
  static MaskTextInputFormatter maskTextInputFormatter =
      MaskTextInputFormatter(mask: '###-###-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

  static List<String> nameSplit({required String fullname}) {
    List<String> nameList = [];
    try {
      try {
        int idx = fullname.indexOf(" ");
        nameList = [fullname.substring(0, idx).trim(), fullname.substring(idx + 1).trim()];
      } catch (error, stackTrace) {
        // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
        nameList.add(fullname.trim());
        nameList.add("");
      }
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }

    return nameList;
  }

  static String trimText({required String string, required int StringLength}) {
    try {
      return "${string.substring(0, StringLength)}...";
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
      return string;
    }
  }

  static String removeLastElement(String str) {
    if (str.isNotEmpty) {
      str = str.substring(0, str.length - 1);
    }

    return str;
  }

  static String convertToTitleCase(String text) {
    if (text.length <= 1) {
      return text.toUpperCase();
    }

    final List<String> words = text.split(' ');

    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);
        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    return capitalizedWords.join(' ');
  }

  static RichText makeUrlClickAble({required String message, required TextStyle textStyle}) {
    // final RegExp urlRegex = RegExp(r"(?:(?:https?|ftp)://)?[\w/\-?=%.]+\.[\w/\-?=%.]+");
    // final RegExp urlRegex = RegExp(r"^(?:(?:https?|ftp)://)?[\w/\-?=%.]+\.[\w/\-?=%.]+");
    // final RegExp urlRegex = RegExp(r"^(?:(?:https?|ftp)://)?(?:[\w/\-?=%.]+\.[\w/\-?=%.]+)$");
    // final RegExp urlRegex = RegExp(r"^(?:(?:https?|ftp)://)?(?:[\w/\-?=%.]+\.[\w/\-?=%.]+)$");
    final RegExp urlRegex = RegExp(r"(https?://(?:www\.|(?!www))[^\s.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})");

    final Iterable<RegExpMatch> matches = urlRegex.allMatches(message);
    List<TextSpan> textSpans = [];
    int currentStart = 0;
    for (Match match in matches) {
      if (match.start != currentStart) {
        textSpans.add(TextSpan(text: message.substring(currentStart, match.start).trim(), style: textStyle));
      }
      String? url = match.group(0);
      textSpans.add(
        TextSpan(
          text: url?.trim(),
          style: textStyle.copyWith(color: kColorBlueDark, decoration: TextDecoration.underline, decorationColor: kColorBlueDark),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // UrlLauncher.launchURL(url!);
            },
        ),
      );
      currentStart = match.end;
    }

    if (currentStart != message.length) {
      textSpans.add(TextSpan(text: message.substring(currentStart).trim(), style: textStyle));
    }
    return RichText(text: TextSpan(children: textSpans));
  }
}
