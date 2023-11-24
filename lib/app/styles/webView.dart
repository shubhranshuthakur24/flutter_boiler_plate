import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'k_icons.dart';

class WebViews extends StatefulWidget {
  String url;

  WebViews({super.key, required this.url});

  @override
  _WebViewsState createState() => _WebViewsState();
}

class _WebViewsState extends State<WebViews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.topRight,
              width: double.infinity,
              color: Colors.white,
              child: customInkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  crossIcon,
                  color: Colors.grey.shade900,
                  size: 24.0,
                ),
              ),
            ),
            Flexible(
              child: WebViews(
                url: widget.url,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
