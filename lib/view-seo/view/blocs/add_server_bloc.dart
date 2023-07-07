import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/net-work/src/api/api.dart';
import 'package:web_flutter/net-work/src/api/src/home_request.dart';

class AddServerBloc with BodyMixin {
  PagesScope pageScope = PagesScope();

  ///域名
  final TextEditingController iNameController = TextEditingController();

  ///投诉次数
  final TextEditingController locationController = TextEditingController();

  ///投诉理由
  final TextEditingController ispController = TextEditingController();

  void onSubmit() async {
    try {
      UX.show();
      await HomeRequest.postAddServer(
        iname: iNameController.text,
        location: locationController.text,
        isp: ispController.text,
      );
      UX.hidden();
    } catch (e) {
      UX.hidden();
      UX.toast(e.toString());
    }
  }
}
