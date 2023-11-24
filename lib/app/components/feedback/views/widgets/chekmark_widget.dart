import 'package:flutter_boiler_plate/app/styles/colors.dart';
import 'package:flutter_boiler_plate/app/utils/device_related/device_identify.dart';
import 'package:flutter/material.dart';

class CheckmarkCircleWidget extends StatefulWidget {
  const CheckmarkCircleWidget({super.key});

  @override
  _CheckmarkCircleWidgetState createState() => _CheckmarkCircleWidgetState();
}

class _CheckmarkCircleWidgetState extends State<CheckmarkCircleWidget> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  _startAnimation() async {
    await Future.delayed(Duration(seconds: 1));
    if(mounted){
      setState(() {
        _isVisible = !_isVisible;
        _startAnimation();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:kDevicesIsMobile(context)?40: MediaQuery.of(context).size.width * 0.12,
        height:kDevicesIsMobile(context)?40: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          color: kColorGreen,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width:kDevicesIsMobile(context)?38: MediaQuery.of(context).size.width * 0.1,
            height:kDevicesIsMobile(context)?38: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
              color: kColorGreenLight,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child:  Icon(
                  Icons.check,
                  color: kColorGreen,
                  size:kDevicesIsMobile(context)?25: 60.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


