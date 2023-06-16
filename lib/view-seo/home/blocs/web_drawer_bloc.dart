import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/home/components/drawer_model.dart';

class WebDrawerBloc with BodyMixin {
  int navDrawerIndex = 0;
  PagesScope pageScope = PagesScope();

  final List<DrawerModel> listDrawer = <DrawerModel>[
    DrawerModel(
      type: NavigationDrawerType.http,
      value: "test222.com",
      message: "等遇到问题的时候，会第一时间想起来。",
    ),
    DrawerModel(
      type: NavigationDrawerType.failure,
      value: "zhuanlan.zhihu.com",
      message: "会第一时间想起来。",
    ),
    DrawerModel(
      type: NavigationDrawerType.http,
      value: "zhuanlan.zhihu.com",
      message: "等遇到问题的时候，",
    ),
    DrawerModel(
      type: NavigationDrawerType.waiting,
      value: "test222sdfds.com",
      message: "就这样的能力，",
    ),
    DrawerModel(
      type: NavigationDrawerType.http,
      value: "zhuanlan.zhihu.com",
      message: "哪些组件可以溢出，",
    ),
    DrawerModel(
      type: NavigationDrawerType.closeHttps,
      value: "test222.com",
      message: "总结了这些多溢出的方案，会第一时间想起来。",
    ),
    DrawerModel(
      type: NavigationDrawerType.http,
      value: "test222.com",
      message: "也是为了让大家了解一下，",
    ),
  ];
  List<TextButtonModel> listButton = <TextButtonModel>[
    TextButtonModel("刷新", onPressed: () {}),
    TextButtonModel("广告", onPressed: () {}),
    TextButtonModel("友链", onPressed: () {}),
    TextButtonModel("权重倒序", onPressed: () {}),
  ];

  List<String> titleModel = [
    "全部状态",
    "禁用站点",
    "等待建站",
    "建站中",
    "建站完成",
    "建站失败",
  ];
  final uPageScope = UpdateScope();
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  set selectIndex(int index) {
    _selectIndex = index;
    print(_selectIndex);
    uPageScope.update();
  }

  void onDestinationSelected(int selectedIndex) {
    navDrawerIndex = selectedIndex;
    pageScope.update();
  }

  void onPressed(MenuController controller) {
    if (controller.isOpen) {
      controller.close();
    } else {
      controller.open();
    }
  }

  void onaaa(int index, DrawerModel model) {
    selectIndex = index;
    context.goNamed(AppRouters.bbbPath, queryParameters: {"model": model});
  }
}
