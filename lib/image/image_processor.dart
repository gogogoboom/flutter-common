import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gogoboom_flutter_common/utils/string_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../gogoboom_flutter_common.dart';

Future<List<AssetEntity>?> selectWechatImage({
  required BuildContext context,
  int size = 1,
  bool enableVideo = false,
  List<AssetEntity>? selectedAssets,
}) =>
    AssetPicker.pickAssets(context,
        maxAssets: size,
        selectedAssets: selectedAssets,
        requestType: enableVideo ? RequestType.common : RequestType.image);

Future<AssetEntity?> selectWechatCamera({required BuildContext context}) =>
    CameraPicker.pickFromCamera(context);

Future<File> compressAndGetFile(File? file) async {
  if (file == null || !file.existsSync()) {
    logger.w('所选图片不存在');
    throw const FileSystemException('所选图片不存在');
  }
  final Directory dir = await getTemporaryDirectory();
  final String targetPath =
      '${dir.absolute.path}/.${StringUtils.randomUUID()}.jpg';
  final File? result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 80,
    minWidth: 480,
    minHeight: 480,
  );
  if (result == null) {
    logger.w('压缩图片失败！');
    throw const FileSystemException('压缩文件失败');
  }
  logger.d(
    '压缩前文件大小 -> 「${file.lengthSync()}」,压缩后文件大小 -> 「${result.lengthSync()}」',
  );
  return result;
}

Future<List<AssetEntity>?> selectPhoto(
  int type, {
  required BuildContext context,
  int size = 1,
  bool enableVideo = false,
  List<AssetEntity>? selectedAssets,
}) async {
  List<AssetEntity>? pickedFiles;
  if (type == 0) {
    pickedFiles = await selectWechatImage(
      context: context,
      size: size,
      enableVideo: enableVideo,
      selectedAssets: selectedAssets,
    );
  } else {
    final AssetEntity? assetEntity = await CameraPicker.pickFromCamera(context,
        enableRecording: enableVideo);
    if (assetEntity == null) {
      return null;
    }
    pickedFiles = <AssetEntity>[assetEntity];
  }
  return pickedFiles;
}
