import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

class SEOTabBarBloc with BodyMixin {
  int selectIndex = 0;

  PagesScope pageScope = PagesScope();
  List<SEOTabBarModel>? list;
  List<Tab> get homeLists {
    return [
      tabs(title: "网站设置"),
      tabs(title: "友情链接"),
      tabs(title: "广告设置"),
      tabs(title: "统计代码"),
      tabs(title: "模版代码"),
      tabs(title: "Nainx配置"),
    ];
  }

  List<SEOTabBarModel> tabNameList = [
    SEOTabBarModel(AppRouters.siteSettingsNamed, title: "网站设置"),
    SEOTabBarModel(AppRouters.friendlyLinksNamed, title: "友情链接"),
    SEOTabBarModel(AppRouters.nginxConfigNamed, title: "广告设置"),
    SEOTabBarModel(AppRouters.statisticsNamed, title: "统计代码"),
    SEOTabBarModel(AppRouters.advertisingNamed, title: "模版代码"),
    SEOTabBarModel(AppRouters.templateNamed, title: "Nainx配置"),
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
