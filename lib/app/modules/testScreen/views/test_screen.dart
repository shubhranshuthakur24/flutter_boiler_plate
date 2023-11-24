import 'package:flutter_boiler_plate/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/test_screen_services.dart';

class TestScreen extends GetView<TestScreenServices> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Container(
      height: 100,
      color: kColorBlueDark,
    ),);
  }
}
