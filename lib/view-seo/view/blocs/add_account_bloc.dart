import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/model/model.dart';
import 'package:web_flutter/model/src/server_model_entity.dart';
import 'package:web_flutter/net-work/src/api/api.dart';

import '../../../components/components.dart';

class AddAccountBloc with BodyMixin<List<ServerModelEntity>?> {
  String? servers;

  double sliderValue = 5;

  PagesScope pageScope = PagesScope();
  void onSlider(double value) {
    sliderValue = value;
    maxCountController.text = "$value";
    pageScope.update();
  }

  ///账号
  final TextEditingController accountController = TextEditingController();

  ///最大投诉次数
  final TextEditingController maxCountController = TextEditingController();

  List<ServerModelEntity>? listModel;

  @override
  Future<List<ServerModelEntity>?> onInit() async {
    try {
      listModel = [];
      await onLoading();
      return listModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ServerModelEntity>?> onLoading() async {
    try {
      var res = await HomeRequest.getAccount();
      listModel?.addAll(res!);
      controller.withData(listModel);
      return listModel;
    } catch (e) {
      rethrow;
    }
  }

  void onMenu(String serversId) {
    servers = serversId;
    pageScope.update();
  }

  void onSubmit() async {
    try {
      UX.show();

      AccountModelEntity params = AccountModelEntity();
      params.cookie = accountController.text;
      params.dayMaxReport = maxCountController.text;
      params.serverId = servers ?? '0';
      await HomeRequest.postAccount(param: params);
      UX.hidden();
      IToast.show("添加成功");
    } catch (e) {
      UX.hidden();
      UX.toast(e.toString());
    }
  }
}
