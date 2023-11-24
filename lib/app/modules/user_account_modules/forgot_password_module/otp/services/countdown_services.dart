import 'dart:async';

import 'package:get/get.dart';

class CountdownServices extends GetxController {
  late Timer _timer;
  RxInt start = 360.obs;

  @override
  onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }
}
