import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo.dart';

class UserHomeBloc with BodyMixin {
  int? selectIndex;
  Map<String, dynamic>? queryParameters;

  List<ServersModel> serverList = [
    ServersModel("103.146.158.58 - 103.146.158.58", 0),
    ServersModel("电商-01 - 156.233.143.202", 1),
  ];
  List<ITabBarModel> get model => [
        ITabBarModel(
          AppRouters.userMessageCenterNamed,
          title: "消息中心",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.userMessageCenterNamed,
          title: "个人资料",
          icon: Icons.add_business,
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
