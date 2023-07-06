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
          AppRouters.complaintNamed,
          title: "添加投诉域名",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.addAccountNamed,
          title: "导入和删除百度账号",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.addServerNamed,
          title: "添加服务器和位置分组",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.reasonDeletonNamed,
          title: "删除数据",
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
