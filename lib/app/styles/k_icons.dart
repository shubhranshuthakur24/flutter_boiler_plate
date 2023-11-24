import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double kIconSize = 24;
const double kIconSizeH2 = 12;
const double kIconSizeH1 = 25;

const IconData kIconAdd = CupertinoIcons.add_circled_solid;
const IconData kIconTimezone = CupertinoIcons.map_pin_ellipse;
const IconData kIconGoogle = FontAwesomeIcons.google;

const IconData kIconChecked = CupertinoIcons.check_mark_circled;
const IconData kIconRadioUnChecked = CupertinoIcons.circle;
const IconData kIconRadioChecked = CupertinoIcons.check_mark_circled;
const IconData kIconSearch = CupertinoIcons.search;
const IconData kIconReview = CupertinoIcons.conversation_bubble;
const IconData kIconSupport = CupertinoIcons.question;
const IconData kIconCross = CupertinoIcons.xmark;
const IconData kIconPerson = FontAwesomeIcons.user;
const IconData kIconCalendar = CupertinoIcons.calendar;
const IconData kIconShare = CupertinoIcons.share;
const IconData kIconDelete = CupertinoIcons.delete;
const IconData kIconInformation = CupertinoIcons.info_circle;

Widget customInkWell({required VoidCallback? onTap, required Widget child, Color? backgroundColor}) {
  return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(color: backgroundColor ?? Colors.transparent, child: child));
}
