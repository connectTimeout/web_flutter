import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/statistics/src/components/model.dart';

class SiteSettingsBloc with BodyMixin {
  PagesScope pageScope = PagesScope();
  final TextEditingController controllerOutlined = TextEditingController();
  bool onCensorOffstage = true;
  bool isChecked = true;
  bool isChecked1 = true;
  bool isChecked2 = true;
  bool iSwitch = true;

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
  ModelPage? values;

  HttpOptions selectedOption = HttpOptions.option1;
  FileFormatOptions fileFormatOptions = FileFormatOptions.option1;

  void onSwitch(bool? value) {
    iSwitch = value!;
    pageScope.update();
  }

  void onCensorEvent() {
    onCensorOffstage = !onCensorOffstage;

    pageScope.update();
  }

  void onCheckbox(bool? value) {
    isChecked = value!;
    pageScope.update();
  }

  void onCheck1box(bool? value) {
    isChecked1 = value!;
    pageScope.update();
  }

  void onCheck2box(bool? value) {
    isChecked2 = value!;
    pageScope.update();
  }

  void onChanged(HttpOptions? value) {
    selectedOption = value!;
    pageScope.update();
  }

  void onFileChanged(FileFormatOptions? value) {
    fileFormatOptions = value!;
    pageScope.update();
  }
}
