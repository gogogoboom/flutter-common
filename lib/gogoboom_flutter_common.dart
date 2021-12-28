
library gogoboom_flutter_common;

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

export 'package:logger/logger.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:pull_to_refresh/pull_to_refresh.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';

Logger logger = Logger();
Uuid uuid = const Uuid();

class GogoboomFlutterCommon {
  static const MethodChannel _channel = MethodChannel('gogoboom_flutter_common');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}