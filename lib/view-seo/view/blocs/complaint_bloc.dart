import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/model/src/batch_task_model_entity.dart';
import 'package:web_flutter/net-work/src/api/api.dart';
import 'package:web_flutter/net-work/src/api/src/home_request.dart';

class ComplaintBloc with BodyMixin {
  PagesScope pageScope = PagesScope();

  double sliderValue = 30;

  bool? isCheckbox = false;

  late String type;

  /// 默认类型
  late FileFormatOptions fileFormatOptions = FileFormatOptions.option1;

  ///域名
  final TextEditingController domainNameController = TextEditingController();

  ///投诉次数
  final TextEditingController countController = TextEditingController();

  ///投诉理由
  final TextEditingController complaintController = TextEditingController();

  void onSlider(double value) {
    sliderValue = value;
    countController.text = "$value";
    pageScope.update();
  }

  void onRadio(dynamic value, String types) {
    fileFormatOptions = value!;
    type = types;
    pageScope.update();
  }

  void onSubmit() async {
    try {
      UX.show();
      BatchTaskModelEntity params = BatchTaskModelEntity();
      params.domains = domainNameController.text;
      params.reportNum = countController.text;
      params.reportReason = complaintController.text;
      params.reportType = type;
      await HomeRequest.postBatchTask(param: params);
      UX.hidden();
    } catch (e) {
      UX.hidden();
      UX.toast(e.toString());
    }
  }
}
