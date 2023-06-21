import 'package:flutter/material.dart';
import 'package:web_flutter/components/common/I_user_module/src/i_home_cell.dart';
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
          title: "返回主页",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.siteSettings1Named,
          title: "返回主页",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.siteSettings1Named,
          title: "返回主页",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          "soepage3",
          title: "返回主页",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          "soepage4",
          title: "返回主页",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
      ];

  @override
  Future onInit() async {
    var sp = await SpUtil.getInstance();
    var selectInde = sp?.getInt("serverIndex");
    selectIndex = selectInde;
    queryParameters = {"serverId": "$selectIndex"};
    return serverList;
  }
}
