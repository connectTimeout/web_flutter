import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/clone/src/model/parameters_mdoel.dart';

class ParametersBloc with BodyMixin {
  double sliderValue0 = 30;
  double sliderValue1 = 5;
  double? count;
  bool? isCheckbox = false;
  TextEditingController? countController = TextEditingController();

  PagesScope pagesScope = PagesScope();
  List<ParametersModel> parameters0List = [
    ParametersModel("TKD转码", true, "转换TKD为ascii编码"),
    ParametersModel("内容伪原创", true, "转换TKD为ascii编码"),
    ParametersModel("替换文章标题", false, "转换TKD为ascii编码"),
  ];
  List<ParametersModel> parameters1List = [
    ParametersModel("代码伪原创", true, "转换TKD为ascii编码"),
    ParametersModel("IMG标签填词", true, "转换TKD为ascii编码"),
    ParametersModel("A标签填词", false, "转换TKD为ascii编码"),
  ];
  List<ParametersModel> parameters2List = [
    ParametersModel("蜘蛛视角", true, "转换TKD为ascii编码"),
    ParametersModel("反审查状态", true, "转换TKD为ascii编码"),
    ParametersModel("屏蔽联系方式", false, "转换TKD为ascii编码"),
  ];
  List<ParametersModel> parameters3List = [
    ParametersModel("蜘蛛视角", true, "转换TKD为ascii编码"),
    ParametersModel("反审查状态", true, "转换TKD为ascii编码"),
  ];

  void onSlider(double value) {
    sliderValue0 = value;
    countController!.text = "$value";
    pagesScope.update();
  }

  void onSlider1(double value) {
    sliderValue1 = value;
    pagesScope.update();
  }

  void onCheckbox(bool? value) {
    isCheckbox = value!;
    pagesScope.update();
  }

  void onRadio(dynamic value, dynamic type) {
    type = value;
    pagesScope.update();
  }
}
