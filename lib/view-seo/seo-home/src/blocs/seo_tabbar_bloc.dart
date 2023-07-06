import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

class SEOTabBarBloc with BodyMixin {
  int selectIndex = 0;

  PagesScope pageScope = PagesScope();
  List<SEOTabBarModel>? list;

  List<SEOTabBarModel> tabNameList = [
    SEOTabBarModel(AppRouters.siteSettingsNamed, title: "账号"),
    SEOTabBarModel(AppRouters.friendlyLinksNamed, title: "每日最大投诉次数"),
    SEOTabBarModel(AppRouters.nginxConfigNamed, title: "分配的服务器ID"),
  ];

  List<SEOTabBarModel> tabFailureList = [
    SEOTabBarModel("soepage", title: "网站设置"),
  ];

  void onPressed(BuildContext context, int index, int id, SEOTabBarModel? model,
      DomainNameModel domain) {
    selectIndex = index;
    context.goNamed(
      model?.namePath ?? AppRouters.siteSettingsNamed,
      queryParameters: {
        'ids': "${index + 20}",
        "serverId": "$id",
      },
      extra: domain,
    );
  }
}
