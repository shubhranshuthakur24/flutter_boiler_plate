import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ChangeThisWidgetWithImage extends StatelessWidget {
  const ChangeThisWidgetWithImage({super.key,  this.containerHeight = 20,  this.containerWidth = 100,  this.text = "Image", this.isMarginAvailable = false, this.isPaddingAvailable = false, this.marginHorizontal = 10, this.marginVertical = 10, this.paddingHorizontal =10, this.paddingVertical = 10});
  final double ? containerHeight;
  final double ? containerWidth;
  final double marginHorizontal;
  final double marginVertical;
  final double paddingHorizontal;
  final double paddingVertical;
  final String ? text;
  final bool ? isMarginAvailable ;
  final bool ? isPaddingAvailable ;

  @override
  Widget build(BuildContext context) {
    double verticalHeight = MediaQuery.of(context).size.height * 0.030 ;
    double horizontalWidth = MediaQuery.of(context).size.height * 0.012 ;
    return  Container(
      margin:isMarginAvailable!?  EdgeInsets.symmetric(horizontal: horizontalWidth,vertical: verticalHeight):null,
      padding:isPaddingAvailable!?  EdgeInsets.symmetric(horizontal: horizontalWidth,vertical: verticalHeight):null,
      color: kColorMaroonLight,
      height: containerHeight!,
      width: containerWidth!,
      child:  Center(child:  Text(text!)),
    );
  }
}
