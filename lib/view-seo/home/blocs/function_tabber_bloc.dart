import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/home/components/function_tabbar_model.dart';

class FunctionTabBerBloc with BodyMixin {
  final uPageScope = UpdateScope();
  final pageScope = PagesScope();
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;
  List<FunctionTabBarModel> functionList = [
    FunctionTabBarModel(icon: Icons.personal_video, title: "网站统计"),
    FunctionTabBarModel(icon: Icons.upload_file, title: "网站收录"),
    FunctionTabBarModel(icon: Icons.assessment, title: "蜘蛛统计"),
    FunctionTabBarModel(icon: Icons.settings, title: "功能大全"),
    FunctionTabBarModel(icon: Icons.content_copy, title: "克隆配置"),
  ];

  set selectIndex(int index) {
    _selectIndex = index;
    print(_selectIndex);
    uPageScope.update();
  }
}
