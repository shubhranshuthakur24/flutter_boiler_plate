import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

SizedBox kImageH1({required String imageUrl, required String name}) {
  return SizedBox(
    width: 107,
    height: 107,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          color: kColorBlueExtraLight,
          child: imageUrl.trim().isEmpty
              ? _nameImage(name)
              : CachedNetworkImage(
                  imageUrl: imageUrl,
                  errorWidget: (a, b, c) {
                    return _nameImage(name);
                  },
                ),
        ),
      ),
    ),
  );
}

Container _nameImage(String name) {
  return Container(
    color: kColorWhite,
    padding: const EdgeInsets.all(5),
    child: kNameText(name: name, color: kColorWhite),
  );
}

SizedBox kImageH2({required String imageUrl, required String name}) {
  return SizedBox(
    width: 50,
    height: 50,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: FittedBox(
        fit: BoxFit.cover,
        child: imageUrl.trim().isEmpty
            ? kNameText(name: name)
            : CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (a, b, c) {
                  return kNameText(name: name);
                },
              ),
      ),
    ),
  );
}

SizedBox kImageH4({required String imageUrl, required String name}) {
  return SizedBox(
    width: 60,
    height: 60,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: FittedBox(
        fit: BoxFit.cover,
        child: imageUrl.trim().isEmpty
            ? kNameText(name: name)
            : CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (a, b, c) {
                  return kNameText(name: name);
                },
              ),
      ),
    ),
  );
}

SizedBox kImageH3({required String imageUrl, required String name}) {
  return SizedBox(
    width: 30,
    height: 30,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: FittedBox(
        fit: BoxFit.cover,
        child: imageUrl.trim().isEmpty
            ? kNameText(name: name)
            : CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (a, b, c) {
                  return kNameText(name: name);
                },
              ),
      ),
    ),
  );
}

class kImageWidget extends StatelessWidget {
  const kImageWidget(
      {Key? key,
      required this.imageUrl,
      required this.name,
      this.imageHeight,
      this.imageWidth,
      this.imageRadius,
      this.textSize = 40})
      : super(key: key);
  final String imageUrl;
  final String name;
  final double? imageHeight;
  final double? imageWidth;
  final double? imageRadius;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: imageRadius ?? 30,
      backgroundColor: kColorBlueDark,
      child: imageUrl.trim().isEmpty
          ? kNameText(name: name, textSize: textSize)
          : CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: kColorBlueExtraLight,
                  borderRadius: BorderRadius.circular(1000),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => kNameText(name: name, textSize: textSize),
            ),
    );
  }
}

CircleAvatar kNameText({
  required String name,
  double textSize = 20,
  Color? color,
}) {
  return CircleAvatar(
    backgroundColor: color ?? kColorMaroon,
    child: Center(
        child: Text(
      name == "" ? "R" : name[0].toUpperCase(),
      style: TextStyle(color: (color == null) ? kColorWhite : kColorBlueDark, fontSize: textSize),
    )),
  );
}
