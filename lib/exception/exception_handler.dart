import 'package:flutter/material.dart';
import 'package:gogoboom_flutter_common/gogoboom_flutter_common.dart';


class ExceptionHandler {
  static void handleException(FlutterErrorDetails details) {
    final Map<String, String> errorMsg = <String, String>{
      'exception': details.exceptionAsString(),
      'stackTrace': details.stack.toString(),
    };
    final Object exception = details.exception;
    logger.e(exception);
    if (exception is BaseError) {
      ToastUtil.error(exception.message!);
    } else if (exception is DioError) {
      if (exception.error is ApiError) {
        ToastUtil.error('${exception.error.statusMessage}');
        return;
      }
      ToastUtil.error('${exception}');
    } else {
      // ToastUtil.error('$exception');
    }
  }
}
