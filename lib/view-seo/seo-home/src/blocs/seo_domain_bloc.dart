import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

class SEODomainBloc with BodyMixin {
  int selectIndex = -1;
  List<DomainNameModel>? domainList;
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
  Map<int, List<DomainNameModel>> domainMap = {0: drawerList, 1: drawersList};

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

  void onDomainTab(BuildContext context, int index, int id) {
    selectIndex = index;
    context.goNamed(AppRouters.siteSettingsNamed,
        extra: domainList?[index], queryParameters: {"serverId": "$id"});
  }

  void onPressed(MenuController controller) {
    if (controller.isOpen) {
      controller.close();
    } else {
      controller.open();
    }
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

  Widget buildAddBtn(SEODomainBloc bloc) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return SizedBox(
          height: 20,
          width: 20,
          child: IconButton(
            iconSize: 16,
            padding: const EdgeInsets.all(0),
            onPressed: () => bloc.onPressed(controller),
            icon: const Icon(CupertinoIcons.slider_horizontal_3),
          ),
        );
      },
      menuChildren: [
        ...bloc.titleModel.map(
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
}
