import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-clone/src/model/parameters_mdoel.dart';

class ParametersVisibleBloc with BodyMixin {
  List<ParametersVisibleModel> parametersList = [
    ParametersVisibleModel("TKD转码", true),
    ParametersVisibleModel("内容伪原创", true),
    ParametersVisibleModel("替换文章标题", true),
    ParametersVisibleModel("代码伪原创", true),
    ParametersVisibleModel("IMG标签填词", true),
    ParametersVisibleModel("A标签填词", true),
    ParametersVisibleModel("填词密度", true),
    ParametersVisibleModel("替换A标签文本", true),
    ParametersVisibleModel("文件格式", true),
    ParametersVisibleModel("克隆深度", true),
    ParametersVisibleModel("蜘蛛视角", true),
    ParametersVisibleModel("反审查状态", true),
    ParametersVisibleModel("屏蔽联系方式", true),
    ParametersVisibleModel("模板限制", true),
    ParametersVisibleModel("模板类型", true),
    ParametersVisibleModel("禁用页面JS", true),
    ParametersVisibleModel("使用模板库", true),
  ];
}
