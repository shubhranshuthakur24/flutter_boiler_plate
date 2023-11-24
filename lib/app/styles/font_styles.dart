import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final TextStyle kFontLato = GoogleFonts.lato();
final TextStyle kFontNotoSans = GoogleFonts.notoSans();
final TextStyle kFontPoppins = GoogleFonts.poppins();

///Heading
final TextStyle kFontLatoS30W400H1 = kFontLato.copyWith(fontSize: 30, fontWeight: FontWeight.w400, color: kColorBlack);
final TextStyle kFontLatoS20W400H2 = kFontLato.copyWith(fontSize: 20, fontWeight: FontWeight.w400, color: kColorBlack);

///Sub Heading
final TextStyle kFontPoppinsS20W400SH1 = kFontPoppins.copyWith(fontSize: 20, fontWeight: FontWeight.w400, color: kColorBlack);
final TextStyle kFontPoppinsS15W400SH2 = kFontPoppins.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: kColorBlack);
final TextStyle kFontPoppinsS12W400SH3 = kFontPoppins.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: kColorBlack);

///Para 1
final TextStyle kFontNotoSansS18W400Para1 =
    kFontNotoSans.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: kColorBlueDark);
final TextStyle kFontNotoSansS15W400Para2 = kFontNotoSans.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: kColorBlack);

///Sub Para
final TextStyle kFontNotoSansS12W400SubPara =
    kFontNotoSans.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: kColorBlack);

///Button
final TextStyle kFontNotoSansS15W600Button1 =
    kFontNotoSans.copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: kColorMaroon);
final TextStyle kFontNotoSansS13W600Button2 =
    kFontNotoSans.copyWith(fontSize: 13, fontWeight: FontWeight.w600, color: kColorBlueDark);

///Unidentified
final TextStyle kFontLatoS18W400 = kFontLato.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: kColorBlack);
final TextStyle kFontPoppinsS10W400 = kFontPoppins.copyWith(fontSize: 10, fontWeight: FontWeight.w400, color: kColorBlack);
final TextStyle kFontPoppinsS11W400 = kFontPoppins.copyWith(fontSize: 11, fontWeight: FontWeight.w400, color: kColorBlueDark);
final TextStyle kFontPoppinsS15W400UnderLine = kFontPoppins.copyWith(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: kColorBlack,
  decoration: TextDecoration.underline,
);
