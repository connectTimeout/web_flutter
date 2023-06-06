import 'package:web_flutter/utils/utils.dart';

import 'exception.dart';
import 'exception_handle.dart';

Future request(
  Function() block, {
  bool showLoading = true,
  bool Function(ApiException)? onError,
}) async {
  try {
    
    await loading(block, isShowLoading: showLoading);
  } catch (e) {
    handleException(e, onError: onError);
  }
  return;
}
