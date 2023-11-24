import 'package:get/get.dart';

late double kFontSize14_9;

late double kFontSize10;

late double kFontSize11;

late double kFontSize12;

late double kFontSize13;

late double kFontSize14;

late double kFontSize15;

late double kFontSize16;

late double kFontSize17;

late double kFontSize18;

late double kFontSize20;

late double kFontSize22;

late double kFontSize23;

late double kFontSize24;

late double kFontSize25;

late double kFontSize28;

late double kFontSize30;

late double kFontSize36;

late double kFontSize32;

late double kFontSize48;

void fontSizeIncreaseForMobileWeb() {
  kFontSize14_9 = 14.9;
  kFontSize10 = 10;
  kFontSize11 = 11;
  kFontSize12 = 12;
  kFontSize13 = 13;
  kFontSize14 = 14;
  kFontSize15 = 15;
  kFontSize16 = 16;
  kFontSize17 = 17;
  kFontSize18 = 18;
  kFontSize20 = 20;
  kFontSize22 = 22;
  kFontSize23 = 23;
  kFontSize24 = 24;
  kFontSize25 = 25;
  kFontSize28 = 28;
  kFontSize30 = 30;
  kFontSize36 = 36;
  kFontSize32 = 32;
  kFontSize48 = 48;
  if ((GetPlatform.isMobile && GetPlatform.isWeb)) {
    double multiplyValue = 1;
    kFontSize14_9 = kFontSize14_9 * multiplyValue;
    kFontSize10 = kFontSize10 * multiplyValue;
    kFontSize11 = kFontSize11 * multiplyValue;
    kFontSize12 = kFontSize12 * multiplyValue;
    kFontSize13 = kFontSize13 * multiplyValue;
    kFontSize14 = kFontSize14 * multiplyValue;
    kFontSize15 = kFontSize15 * multiplyValue;
    kFontSize16 = kFontSize16 * multiplyValue;
    kFontSize17 = kFontSize17 * multiplyValue;
    kFontSize18 = kFontSize18 * multiplyValue;
    kFontSize20 = kFontSize20 * multiplyValue;
    kFontSize22 = kFontSize22 * multiplyValue;
    kFontSize23 = kFontSize23 * multiplyValue;
    kFontSize24 = kFontSize24 * multiplyValue;
    kFontSize25 = kFontSize25 * multiplyValue;
    kFontSize28 = kFontSize28 * multiplyValue;
    kFontSize30 = kFontSize30 * multiplyValue;
    kFontSize36 = kFontSize36 * multiplyValue;
    kFontSize32 = kFontSize32 * multiplyValue;
    kFontSize48 = kFontSize48 * multiplyValue;
  }
}
