import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/net-work/request.dart';

class ReasonDeletonBloc with BodyMixin {
  /// 默认类型
  late FileFormatOptions fileFormatOptions = FileFormatOptions.option1;
  PagesScope pageScope = PagesScope();
  late String type;
  void onRadio(dynamic value, String types) {
    fileFormatOptions = value!;
    type = types;
    pageScope.update();
  }

  void onSubmit() async {
    try {
      UX.show();
      await HomeRequest.postDelete(
        table: type,
        id: iDController.text,
      );
      UX.hidden();
    } catch (e) {
      UX.hidden();
      UX.toast(e.toString());
    }
  }

  final TextEditingController iDController = TextEditingController();
}
