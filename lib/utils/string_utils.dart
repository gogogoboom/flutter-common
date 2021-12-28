
import '../gogoboom_flutter_common.dart';

class StringUtils {
  ///将list转化为上传的字符串
  ///如：[1,2] => "1,2"
  static String transferSubmitStr(List<dynamic> list) {
    String result = '';
    if (list.isEmpty) {
      return result;
    }
    result = '${list[0]}';
    for (int i = 1; i < list.length; i++) {
      result += ',${list[i]}';
    }
    return result;
  }

  static String randomUUID() => uuid.v1().replaceAll('-', '');
}
