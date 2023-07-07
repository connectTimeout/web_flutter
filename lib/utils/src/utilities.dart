import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

typedef ValueCallback<T, S> = T Function(S);

/// 路由函数回调
typedef RouteCallback<T> = void Function(T data, String key);

class IDateUtils {
  IDateUtils._();

  /// 计算过期时间(年、月、日)
  ///
  /// 返回值为null,已过期

  /// 时间格式化，返回字符串，默认格式：2019-01-01
  static String? format(DateTime? date, [String format = 'yyyy-MM-dd']) {
    try {
      if (date == null) return null;
      return DateFormat(format).format(date);
    } catch (e) {
      return null;
    }
  }
}

void xprint(Object object) {
  if (!kReleaseMode) {
    // ignore: avoid_print
    print(object);
  }
}
