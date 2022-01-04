import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_common/gogoboom_flutter_common.dart';

Widget fetchImage(String url,
    {double width = 48,
    double height = 48,
    Color? color,
    String? defaultImagePath}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    imageUrl: url,
    color: color,
    fit: BoxFit.cover,
    placeholder: (BuildContext context, String url) => Image.asset(
      Utils.getImgPath(defaultImagePath ?? commonConfig.defaultImgRes),
      width: width,
      height: height,
      fit: BoxFit.cover,
    ),
    errorWidget: (BuildContext context, String url, dynamic error) =>
        Image.asset(
      Utils.getImgPath(defaultImagePath ?? commonConfig.defaultImgRes),
      width: width,
      height: height,
      fit: BoxFit.cover,
    ),
  );
}

Widget fetchAvatar(String? url, {double size = 60, String? defaultImagePath}) {
  return url == null
      ? Image.asset(
          Utils.getImgPath(defaultImagePath ?? commonConfig.defaultAvatarRes))
      : CachedNetworkImage(
          height: size,
          width: size,
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) => Image.asset(
            Utils.getImgPath(defaultImagePath ?? commonConfig.defaultAvatarRes),
            color: Colors.white,
          ),
          errorWidget: (BuildContext context, String url, dynamic error) =>
              Image.asset(Utils.getImgPath(
                  defaultImagePath ?? commonConfig.defaultAvatarRes)),
        );
}

Widget fetchLocalImage(File? file, {double width = 48, double height = 48}) {
  return file == null
      ? Image.asset(
          Utils.getImgPath(commonConfig.defaultLocalImgRes),
          width: width,
          height: height,
          fit: BoxFit.cover,
        )
      : Image.file(file, fit: BoxFit.cover, width: width, height: height);
}

Widget fetchAssetsImage(String path, {double width = 48, double height = 48}) {
  return Image.asset(path, fit: BoxFit.cover, width: width, height: height);
}
