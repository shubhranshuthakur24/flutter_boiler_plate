import 'package:get/get.dart';

late double _kFontSize24;
late double _kFontSize16;
late double _kFontSize18;
late double _kFontSize12;
late double _kFontSize14;
late double _kFontSize15;

double get kFontSize24 => _kFontSize24;

double get kFontSize16 => _kFontSize16;

double get kFontSize18 => _kFontSize18;

double get kFontSize12 => _kFontSize12;

double get kFontSize14 => _kFontSize14;
double get kFontSize15 => _kFontSize14;

void changeFontSizeAccordingToDevice() {
  _kFontSize24 = 24;
  _kFontSize16 = 16;
  _kFontSize18 = 18;
  _kFontSize12 = 12;
  _kFontSize14 = 14;

  if ((Get.width > 600)) {
    double multipleValue = 1.2;
    _kFontSize24 = _kFontSize24 * multipleValue;
    _kFontSize16 = _kFontSize16 * multipleValue;
    _kFontSize18 = _kFontSize18 * multipleValue;
    _kFontSize12 = _kFontSize12 * multipleValue;
    _kFontSize14 = _kFontSize14 * multipleValue;
  }
}
