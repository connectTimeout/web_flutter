import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/statistics/src/components/model.dart';

class SiteSettingsBloc with BodyMixin {
  PagesScope pageScope = PagesScope();
  final TextEditingController controllerOutlined = TextEditingController();
  final TextEditingController checkController = TextEditingController();
  final TextEditingController analysisController = TextEditingController();

  ///首页标题
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController innerTitleController = TextEditingController();

  ///首页关键词
  final TextEditingController keyworController = TextEditingController();
  final TextEditingController innerKeywordController = TextEditingController();

  ///首页描述
  final TextEditingController descriptController = TextEditingController();
  final TextEditingController innerDescriptController = TextEditingController();
  bool onCensorOffstage = true;
  bool isCheckedW = false;
  bool isChecked = false;
  bool isCheckedM = false;
  bool iSwitch = true;

  ///file
  List<ModelPage> configureList = [
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
  ];

  List<FileFormaModel> fileFormatList = [
    FileFormaModel(
      "html",
      FileFormatOptions.option1,
    ),
    FileFormaModel(
      "php",
      FileFormatOptions.option2,
    ),
    FileFormaModel(
      "jsp",
      FileFormatOptions.option3,
    ),
    FileFormaModel(
      "asp",
      FileFormatOptions.option4,
    ),
    FileFormaModel(
      "aspx",
      FileFormatOptions.option5,
    ),
    FileFormaModel(
      "shtml",
      FileFormatOptions.option6,
    ),
  ];
  ModelPage? values;

  HttpOptions groupValueOption = HttpOptions.option1;
  FileFormatOptions fileFormatOptions = FileFormatOptions.option1;

  void onController() {
    checkController.clear();
  }

  void onSwitch(bool? value) {
    iSwitch = value!;
    pageScope.update();
  }

  ///"开启反审查" : "关闭反审查"
  void onCensorEvent() {
    onCensorOffstage = !onCensorOffstage;

    pageScope.update();
  }

  ///禁用站点
  void onDisablePressed() {}

  ///保存修改
  void onSavePressed() {}

  void onChangedChanged(bool? value) {
    isChecked = value!;
    pageScope.update();
  }

  void onChangedWChanged(bool? value) {
    isCheckedW = value!;
    pageScope.update();
  }

  void onChangedMChanged(bool? value) {
    isCheckedM = value!;
    pageScope.update();
  }

  void onChanged(HttpOptions? value) {
    groupValueOption = value!;
    pageScope.update();
  }

  void onFileChanged(FileFormatOptions? value) {
    fileFormatOptions = value!;
    pageScope.update();
  }

  ///ip解析
  bool automaticParsing = true;
  void onAutomaticParsing(bool? value) {
    automaticParsing = value!;
    pageScope.update();
  }

  ///重新解析
  void onReanalysis() {}

  ///效验解析
  void onValidationAnalysis() {}
}
