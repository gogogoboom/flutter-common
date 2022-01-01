
library gogoboom_flutter_common;

import 'package:flutter/services.dart';
import 'package:gogoboom_flutter_common/common_config.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:image_picker/image_picker.dart';
export 'package:file_picker/file_picker.dart';
export 'package:open_file/open_file.dart';
export 'package:mime/mime.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:logger/logger.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:pull_to_refresh/pull_to_refresh.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'utils/device_util.dart';
export 'common_config.dart';
export 'image/image_loder.dart';
export 'utils/toast.dart';
export 'utils/asset_file.dart';
export 'utils/system_util.dart';
export 'utils/string_utils.dart';
export 'wrapper/keep_alive_wrapper.dart';
export 'exception/exception_handler.dart';
export 'package:flutter_image_compress/flutter_image_compress.dart';
export 'package:video_compress/video_compress.dart';
export 'package:qr_flutter/qr_flutter.dart';
export 'package:qr_code_scanner/qr_code_scanner.dart';

export 'package:gogoboom_flutter_core/gogoboom_flutter_core.dart';

Logger logger = Logger();
Uuid uuid = const Uuid();

CommonConfig commonConfig = CommonConfig();