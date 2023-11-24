import 'package:flutter_boiler_plate/app/styles/colors.dart';
import 'package:flutter/material.dart';

class OnHoverContainer extends StatelessWidget {
  const OnHoverContainer({
    Key? key,
    required this.onHoverChildWidget,
    required this.color,
    required this.isHovered,
  }) : super(key: key);

  final Color color;
  final Widget onHoverChildWidget;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.symmetric(horizontal: 27, vertical: 17),
        decoration: ShapeDecoration(
          color: color,
          shape:isHovered? RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: kColorMaroon),
            borderRadius: BorderRadius.circular(10),
          ):const Border(),
        ),
        // height: 40,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(50),
        //   color: color,
        // ),
        child: Center(child: onHoverChildWidget));
  }
}
