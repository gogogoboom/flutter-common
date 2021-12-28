import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:gogoboom_flutter_common/gogoboom_flutter_common.dart';

class DeviceUtil {
  static Future<String?> getMachineCode() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? machineCode = uuid.v4();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      machineCode = androidInfo.androidId;
      // model = androidInfo.model;
      // os = androidInfo.brand;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      machineCode = iosInfo.identifierForVendor;
      // model = iosInfo.model;
      // os = iosInfo.utsname.sysname;
    }
    return machineCode;
  }
}
