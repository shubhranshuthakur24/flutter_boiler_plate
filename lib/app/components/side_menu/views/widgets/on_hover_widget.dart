import 'package:flutter/material.dart';

import '../../../../utils/device_related/device_identify.dart';

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  final bool isTransform;

  const OnHover({Key? key, required this.builder, this.isTransform = true}) : super(key: key);

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    Matrix4 hovered;
    Matrix4 transform;
    if (kDeviceIsWeb()) {
      hovered = Matrix4.identity()..translate(0, -5, 0);
      transform = isHovered ? hovered : Matrix4.identity();
    }
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // transform: widget.isTransform ? transform : null,
        child: Container(child: widget.builder(isHovered)),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
