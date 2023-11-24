import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class DateTimeRelatedFunction {
  static String formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  static String formatTime(int seconds) {
    if (seconds < 60) {
      return "0m ${seconds}s";
    } else if (seconds < 3600) {
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return "${minutes}m ${remainingSeconds}s";
    } else {
      int hours = seconds ~/ 3600;
      int remainingMinutes = (seconds % 3600) ~/ 60;
      int remainingSeconds = seconds % 60;
      return "${hours}h ${remainingMinutes}m ${remainingSeconds}s";
    }
  }

  static int? dateCompareWithCurrentDateAndReturnDataInDay({required String date}) {
    try {
      int differenceTimeInDay = (DateTime.parse(DateFormat("yyyy-MM-dd").format(DateTime.parse(date)))
              .difference(DateTime.parse((DateFormat("yyyy-MM-dd").format(DateTime.now()))))
              .inDays)
          .round();

      return differenceTimeInDay;
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
    return null;
  }

  static DateTime? dateTimeAndTimeOfDayJoin(DateTime date, TimeOfDay time) {
    try {
      return DateTime(date.year, date.month, date.day, time.hour, time.minute);
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
    return null;
  }

  static TimeOfDay? stringToTimeOfDay(String tod) {
    try {
      DateFormat format = DateFormat('h:mm a');
      DateTime dateTime = format.parse(tod);
      return TimeOfDay.fromDateTime(dateTime);
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }
    return null;
  }

  // static TimeOfDay? stringToTimeOfDay(String tod) {
  //   try {
  //     final format = DateFormat.jm();
  //     convertStringToTimeOfDay(to)
  //     return TimeOfDay.fromDateTime(format.parse(tod));
  //   } catch (error, stackTrace) {
  //     SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
  //   }
  //   return null;
  // }

  static ModelClassNavigatorTimeZoneToCareGiverTimeZone? navigatorTimeZoneToCareGiverTimeZone(
      {required String date,
      required String slotTime,
      bool isCalledForMeetingTimeZoneConvert = false,
      required String careGiverOffSetFromUtc,
      required String navigatorOffSetFromUtc}) {
    try {
      TimeOfDay timeOfDay = stringToTimeOfDay(slotTime)!;
      DateTime navTimeZoneToUtcTimeZone = dateTimeAndTimeOfDayJoin(DateTime.parse(date), timeOfDay)!;
      DateTime tempDateForCompare = navTimeZoneToUtcTimeZone;
      navTimeZoneToUtcTimeZone = navTimeZoneToUtcTimeZone.add(Duration(hours: -(int.parse(navigatorOffSetFromUtc))));
      DateTime utcTimeZoneToCareGiverTimeZone = navTimeZoneToUtcTimeZone.add(Duration(hours: int.parse(careGiverOffSetFromUtc)));
      // if ((navTimeZoneToUtcTimeZone.difference(tempDateForCompare).inDays) == 0 || isCalledForMeetingTimeZoneConvert) {
      return ModelClassNavigatorTimeZoneToCareGiverTimeZone(
        date: utcTimeZoneToCareGiverTimeZone.toString(),
        timeOfDay: (DateFormat("h:mm a").format(utcTimeZoneToCareGiverTimeZone)),
        dateInUtc: navTimeZoneToUtcTimeZone.toString(),
      );
      // }
    } catch (error, stackTrace) {
      // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
    }

    return null;
  }

  static Future<dynamic> delayFunction() async {
    await Future.delayed(200.milliseconds);
  }
}

class ModelClassNavigatorTimeZoneToCareGiverTimeZone {
  final String date;
  final String timeOfDay;
  final String dateInUtc;

  ModelClassNavigatorTimeZoneToCareGiverTimeZone({
    required this.date,
    required this.timeOfDay,
    required this.dateInUtc,
  });
}
