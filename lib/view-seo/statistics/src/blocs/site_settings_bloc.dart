import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';

class SiteSettingsBloc with BodyMixin {
  PagesScope pageScope = PagesScope();
  final TextEditingController controllerOutlined = TextEditingController();
  bool onCensorOffstage = true;
  bool isChecked = true;
  bool isChecked1 = true;
  bool isChecked2 = true;
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
}
