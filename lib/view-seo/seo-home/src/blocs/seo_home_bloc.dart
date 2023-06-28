import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

class SEOHomeBloc with BodyMixin {
  int? selectIndex;
  Map<String, dynamic>? queryParameters;

  List<ServersModel> serverList = [
    ServersModel("103.146.158.58 - 103.146.158.58", 0),
    ServersModel("电商-01 - 156.233.143.202", 1),
  ];
  List<ITabBarModel> get model => [
        ITabBarModel(
          AppRouters.siteSettingsNamed,
          title: "网站管理",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.siteInclusionNamed,
          title: "网站收录",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.overviewNamed,
          title: "蜘蛛统计",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.funAdvertisementNamed,
          title: "功能大全",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.parametersNamed,
          title: "克隆配置",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          "soepage3",
          title: "系统摘要",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          "soepage3",
          title: "CC防御",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          "soepage3",
          title: "WebSSH",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          "soepage3",
          title: "版本升级",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          "soepage3",
          title: "证书配置",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
      ];

  @override
  Future onInit() async {
    var sp = await SpUtil.getInstance();
    var selectInde = sp?.getInt("serverIndex");
    selectIndex = selectInde;
    queryParameters = {"serverId": "${selectInde ?? -1}"};
    return serverList;
  }
}
