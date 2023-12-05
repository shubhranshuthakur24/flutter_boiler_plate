import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../styles/colors.dart';
import '../../../../../../styles/constant_font_size.dart';
import '../../../../../../styles/font_styles.dart';
import '../../../../../../styles/k_icons.dart';
import '../../../../../../utils/device_related/device_identify.dart';

class CommonButtonWidget extends StatefulWidget {
  CommonButtonWidget(
      {Key? key,
      this.showSwitchButton = false,
      required this.buttonName,
      this.leftSideIcon,
      this.onTapLeftSideIcon,
      this.rightSideText,
      this.secondaryTitle,
      this.showHorizontalMargin = true,
      this.showToolTip})
      : super(key: key);
  bool showSwitchButton;
  String buttonName;
  IconData? leftSideIcon;
  VoidCallback? onTapLeftSideIcon;
  String? rightSideText;
  String? secondaryTitle;
  bool showHorizontalMargin;
  bool? showToolTip;

  @override
  State<CommonButtonWidget> createState() => _CommonButtonWidgetState();
}

class _CommonButtonWidgetState extends State<CommonButtonWidget> {
  // NotificationOnOffServices notificationOnOffServices = Get.put(NotificationOnOffServices());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kColorWhite,
      ),
      margin: const EdgeInsets.only(top: 7, left: 16, right: 16),
      height: 68,
      child: customInkWell(
        onTap: widget.onTapLeftSideIcon,
        child: Row(
          children: [
            const SizedBox(
              width: 23,
            ),
            if (widget.leftSideIcon != null)
              Icon(
                widget.leftSideIcon,
                size: 20,
                color: kColorBlueDark,
                // color: kColorBlackBlue,
              ),
            if (widget.leftSideIcon != null)
              const SizedBox(
                width: 23,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.buttonName.trim(),
                    style: kFontNotoSans.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: kColorBlack),
                  ),
                  if (widget.secondaryTitle != null)
                    Text(
                      "",
                      style: TextStyle(fontSize: kFontSize12),
                    )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            if (widget.rightSideText != null)
              Container(
                // color: Colors.green,
                alignment: Alignment.centerRight,
                // width: 72,
                // padding: const EdgeInsets.only(left: kGap10),
                child: Text(
                  widget.rightSideText!,
                  style: kFontNotoSans.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: kColorBlueDark),
                ),
              ),

            if (widget.showSwitchButton == true)
              Obx(() {
                return CupertinoSwitch(
                  activeColor: kColorBlueDark,
                  value:  false ,// Get.find<NotificationOnOffServices>().notificationSwitchButtonBoolValue.value,
                  onChanged: (value) {
                    // Get.find<NotificationOnOffServices>().apiChangeNotificationStatus();
                  },
                );
              }),
            if (widget.showToolTip == true) buildTooltip(context),
            const SizedBox(
              width: 17,
            ),
            // if (widget.rightSideWidget != null)
            //   Container(padding: const EdgeInsets.only(right: 23), child: widget.rightSideWidget!)
          ],
        ),
      ),
    );
  }

  Tooltip buildTooltip(BuildContext context) {
    return Tooltip(
      margin: EdgeInsets.only(
          top: 12, left: context.isPhone ? 30 : (140 + 287), right: kDeviceIsDesktop(context) ? context.width - (1117) : 9),
      richMessage: TextSpan(
        text: "changingTheLanguageWillChangeTheLanguage",
        style: kFontNotoSans.copyWith(color: kColorBlack, fontSize: 12, fontWeight: FontWeight.w400),
        children: const <InlineSpan>[
          // const WidgetSpan(
          //     child: SizedBox(
          //       height: 23,
          //     )),
          // TextSpan(
          //   text:
          //   "Once the account is deactivated, you won't be able to access your account, or retrieve any information.",
          //   style: kFontNotoSans.copyWith(color: kColorBlack, fontSize: 12, fontWeight: FontWeight.w400),
          // ),
        ],
      ),
      // message: 'This message is from tooltip This message is from tooltip This message is from tooltip ',
      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 24),
      showDuration: const Duration(seconds: 10),
      decoration: const ShapeDecoration(
        color: kColorLavenderBlue,
        shape: ToolTipCustomShape(usePadding: false),
      ),
      // verticalOffset: 20,
      // textStyle: TextStyle(fontSize: 18.toDouble(), color: Colors.black),
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: true,
      // margin: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: const Icon(
          Icons.info_outline,
          color: kColorBlueDark,
          // size: kIconSizeH2,
        ),
      ),
    );
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;

  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 0));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10)))
      ..moveTo(rect.topRight.dx - 48, rect.top)
      ..relativeLineTo(10, -20)
      ..relativeLineTo(10, 20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
