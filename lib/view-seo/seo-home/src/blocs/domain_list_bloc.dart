import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/seo_home.dart';

class DomainListBloc with BodyMixin {
  int domainIndex = -1;
  int tabIndex = 0;

  Map<int, List<DomainNameModel>> domainMap = {0: drawerList, 1: drawersList};
  PagesScope pageScope = PagesScope();
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
  List<TextButtonModel> listButton = <TextButtonModel>[
    TextButtonModel("刷新", onPressed: () {}),
    TextButtonModel("广告", onPressed: () {}),
    TextButtonModel("友链", onPressed: () {}),
    TextButtonModel("权重倒序", onPressed: () {}),
  ];
  List<SEOTabBarModel> tabNameList = [
    SEOTabBarModel(AppRouters.overviewNamed, title: "概览"),
    SEOTabBarModel(AppRouters.siteSummaryNamed, title: "网站摘要"),
    SEOTabBarModel(AppRouters.spiderStatisticsNamed, title: "蜘蛛统计"),
    SEOTabBarModel(AppRouters.popularURLNamed, title: "热门URL"),
    SEOTabBarModel(AppRouters.highRequencyNamed, title: "高频IP"),
  ];

  void onPressed(
    BuildContext context,
    int index,
    int id,
    SEOTabBarModel? model,
  ) {
    tabIndex = index;
    context.goNamed(
      model?.namePath ?? AppRouters.overviewNamed,
      queryParameters: {
        'ids': "${index + 20}",
        "serverId": "$id",
      },
    );
  }

  Widget onRefreshDomain(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return SizedBox(
          height: 20,
          width: 20,
          child: IconButton(
            iconSize: 16,
            padding: const EdgeInsets.all(0),
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(CupertinoIcons.slider_horizontal_3),
          ),
        );
      },
      menuChildren: [
        ...titleModel.map(
          (e) {
            return MenuItemButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e),
              ),
              onPressed: () {},
            );
          },
        )
      ],
    );
  }

  List<String> titleModel = [
    "全部状态",
    "禁用站点",
    "等待建站",
    "建站中",
    "建站完成",
    "建站失败",
  ];
}
