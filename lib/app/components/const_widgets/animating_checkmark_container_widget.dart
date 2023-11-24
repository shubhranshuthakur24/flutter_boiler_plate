import 'package:flutter/material.dart';

class CheckmarkCircleWidget extends StatefulWidget {
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
    await Future.delayed(const Duration(milliseconds: 1400));
    setState(() {
      _isVisible = !_isVisible;
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1400),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 85.0,
            ),
          ),
        ),
      ),
    );
  }
}


