import 'dart:developer' as logDev;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/app/components/const_widgets/change_with_image_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import '../utils/device_related/device_identify.dart';
import 'colors.dart';
import 'constant_font_size.dart';
import 'font_styles.dart';
import 'k_icons.dart';


const double kWidthAlertDailog = 725;
const double kHeightAlertDailog = 436;
const double kIconH1 = 30;
const double kIconH2 = 24;
const double textSize = 12;

const bool kBuildForProduction = false;
const bool kBuildForCalgrows = false;
var contantPaddding = const EdgeInsets.only(bottom: 10, top: 1);
final String constantPoppins = GoogleFonts.poppins().fontFamily.toString(); //popins
final String constantLato = GoogleFonts.lato().fontFamily.toString(); //lato
final String constantOpenSans = GoogleFonts.openSans().fontFamily.toString(); //sans

const double constFontSize20 = 20;
const double constFontSize24 = 24;

const double kBorderRadius = 27;
const double archivedOpicity = 0.5;

const double SafeAreTopPadding = 35;
const IconData crossIcon = CupertinoIcons.xmark;
const IconData backIcon = CupertinoIcons.back;

class GoBack extends StatelessWidget {
  const GoBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customInkWell(
      child: const Icon(CupertinoIcons.back, color: kColorBlack),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

void hideLoading() {
  showPrint("hideLoading Called");
  if (Get.isDialogOpen == true) {
    Get.back();
  }
}

void showLoading({String title = "Loading..."}) {
  showPrint("showLoading called");
  Get.dialog(
    WillPopScope(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 300,
              height: 40,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        }),
    barrierDismissible: false,
  );
}

Container nameImage(
    {required String name,
    int width = 120,
    int height = 120,
    Color textColor = Colors.white,
    Color backGroundColor = kColorBlueDark,
    int textSize = 40}) {
  return Container(
    width: width.toDouble(),
    height: height.toDouble(),
    decoration: BoxDecoration(shape: BoxShape.circle, color: backGroundColor),
    child: Center(
        child: Text(
      name == "" ? "N" : name[0].toUpperCase(),
      style: TextStyle(color: textColor, fontSize: textSize.toDouble(), fontFamily: constantOpenSans),
    )),
  );
}

SpinKitRing showSpinkitRing({Color color = kColorMaroon, int size = 30}) {
  return SpinKitRing(
    color: color,
    size: size.toDouble(),
  );
}

void showPrint(String printMessage) {
  // return;
  if (kDebugMode) {
    if (kDeviceIsWeb()) {
      final RegExp pattern = RegExp('.{1,800}');
      pattern.allMatches(printMessage).forEach((RegExpMatch match) => print(match.group(0)));
    } else {
      logDev.log(printMessage, name: "myLog");
    }
  }
}

void showToast(String data,
    {bool showToastInReleaseMode = false,
    Color toastBackGroundColor = kColorMaroonLight,
    String? iconAsset,
    Duration duration = const Duration(seconds: 5),
    bool center = false}) {
  if (kDebugMode || showToastInReleaseMode) {
    FToast fToast = FToast();
    fToast.init(navigatorKey.currentContext!);
    Widget toastWithButton = Container(
      margin: kDevicesIsMobile(navigatorKey.currentContext!) ? const EdgeInsets.only(left: 15, right: 15) : null,
      width: kDeviceIsDesktop(navigatorKey.currentContext!) ? kWidthAlertDailog : navigatorKey.currentContext!.width - 30,
      padding: EdgeInsets.symmetric(horizontal: navigatorKey.currentContext!.isPhone ? 15 : 66.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: toastBackGroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconAsset != null)
            Container(
              margin: const EdgeInsets.only(right: 11),
              child:const ChangeThisWidgetWithImage(),
              // Image.asset(
              //   iconAsset,
              //   width: 30,
              //   height: 30,
              // ),
            ),
          Expanded(
            child:
            SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(text: data.trim(), style: kFontNotoSans.copyWith(
                      fontSize: 15, fontWeight: FontWeight.w400, color: kColorBlack)),
                ],
              ),
            ),),
          //   Text(
          //     data,
          //     softWrap: true,
          //     style: kFontNotoSansS18W400Para1.copyWith(color: kColorBlack),
          //   ),
          // ),
          IconButton(
            icon: const Icon(
              Icons.close,
            ),
            color: kColorBlack,
            onPressed: () {
              fToast.removeCustomToast();
            },
          )
        ],
      ),
    );
    fToast.showToast(
        child: toastWithButton,
        gravity: ToastGravity.TOP,
        toastDuration: duration,
        positionedToastBuilder: (context, child) {
          return center
              ? Positioned(
                  top: 36.0,
                  left: (context.width - kWidthAlertDailog) / 2,
                  right: (context.width - kWidthAlertDailog) / 2,
                  child: child,
                  // left: 16.0,
                )
              : Positioned(
                  top: 36.0,
                  left: kDeviceIsDesktop(context) ? 326.6 : null,
                  child: child,
                  // left: 16.0,
                );
        });
  }
}

TextStyle kConstantBigTextStyle() {
  return TextStyle(fontFamily: constantOpenSans, color: kColorBlack, fontSize: kFontSize48, letterSpacing: -0.3);
}

TextStyle kConstantAssessmentBigTextColor() {
  return TextStyle(
    fontFamily: constantPoppins,
    color: kColorBlack,
    fontWeight: FontWeight.bold,
    fontSize: kFontSize36,
  );
}

TextStyle kButtonTextStyle({Color buttonColor = Colors.white}) {
  return TextStyle(
    fontFamily: constantOpenSans,
    color: buttonColor,
    fontWeight: FontWeight.w600,
    fontSize: kFontSize18,
  );
}

TextStyle kButtonTextStyle1({Color buttonColor = kColorBlack}) {
  return TextStyle(
    fontFamily: constantOpenSans,
    color: buttonColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
}

TextStyle kButtonTextStyle2() {
  return TextStyle(
    fontFamily: constantOpenSans,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.8,
    fontSize: 18,
  );
}

BoxDecoration kConstantGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [kColorSteelGray, kColorSteelGray],
    ),
  );
}

BoxDecoration kConstantGradientNew() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(0xFF05ced1), Color(0xFF6a82d3)],
    ),
  );
}

class kConstantPadding extends StatefulWidget {
  const kConstantPadding({super.key, required this.child});

  final Widget child;

  @override
  State<kConstantPadding> createState() => _kConstantPaddingState();
}

class _kConstantPaddingState extends State<kConstantPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 105),
      child: widget.child,
    );
  }
}

class AssessmentQuestions extends StatelessWidget {
  AssessmentQuestions({super.key, required this.text, this.padding = true});

  final String text;
  bool padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      child: Padding(
        padding: padding == true ? const EdgeInsets.only(left: 19, right: 19, top: 112, bottom: 31) : const EdgeInsets.all(0),
        child: Text(
          text,
          style: kFontLato.copyWith(color: kColorBlack, fontSize: 23, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

TextStyle ToolkitHeaderLarge() {
  return TextStyle(fontFamily: constantLato, color: kColorBlack, fontSize: kFontSize24);
}

class TermsOfUseText extends StatelessWidget {
  final String text;

  const TermsOfUseText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: textSize.toDouble()),
    );
  }
}

class TermsOfUseTextColored extends StatelessWidget {
  final String text;

  const TermsOfUseTextColored({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: kColorBlueDark, fontWeight: FontWeight.w300, fontSize: textSize.toDouble()),
    );
  }
}

String ageCalculator({required String dob}) {
  String age = "";
  try {
    var dobSplit = dob.split("-");
    age = (DateTime.now().year.toInt() - int.parse(dobSplit.last)).toString();
  } catch (error) {
    showPrint(error.toString());
  }

  return age.toString();
}
