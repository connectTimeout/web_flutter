import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/seo_home.dart';

class FunctionsBloc with BodyMixin {
  int tabIndex = 0;
  static final List<DomainNameModel> drawerList = [
    DomainNameModel("tste222", NavigationDrawerType.http, "nihao"),
    DomainNameModel("wwwdfd", NavigationDrawerType.closeHttps, "nihao"),
    DomainNameModel("dfdfdffdf", NavigationDrawerType.failure, "nihao"),
    DomainNameModel("tste22aa2", NavigationDrawerType.waiting, "nihao"),
    DomainNameModel("tste222df", NavigationDrawerType.http, "nihao"),
  ];
  static final List<DomainNameModel> drawersList = [
    DomainNameModel("tste22aa2", NavigationDrawerType.waiting, "nihao"),
    DomainNameModel("tste222df", NavigationDrawerType.http, "nihao"),
  ];
  Map<int, List<DomainNameModel>> domainMap = {0: drawerList, 1: drawersList};
  List<SEOTabBarModel> tabNameList = [
    SEOTabBarModel(AppRouters.funAdvertisementNamed, title: "批量广告"),
    SEOTabBarModel(AppRouters.funStatisticsNamed, title: "批量统计"),
    SEOTabBarModel(AppRouters.funLinkNamed, title: "批量友链"),
    SEOTabBarModel(AppRouters.funRemoveNamed, title: "批量删除"),
  ];

  void onPressed(
    BuildContext context,
    int index,
    int id,
    SEOTabBarModel? model,
  ) {
    tabIndex = index;
    context.goNamed(
      model?.namePath ?? AppRouters.funAdvertisementNamed,
      queryParameters: {
        'ids': "${index + 20}",
        "serverId": "$id",
      },
    );
  }
}
