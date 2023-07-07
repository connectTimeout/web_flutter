import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';

class SEOHomeBloc with BodyMixin {
  int? selectIndex;
  Map<String, dynamic>? queryParameters;

  List<ITabBarModel> get model => [
        ITabBarModel(
          AppRouters.complaintNamed,
          title: "添加投诉域名",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.addAccountNamed,
          title: "添加百度账号",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.addServerNamed,
          title: "添加服务器",
          icon: Icons.home_sharp,
          queryParameters: queryParameters,
        ),
        ITabBarModel(
          AppRouters.addReasonNamed,
          title: "添加投诉理由",
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
    return model;
  }
}
