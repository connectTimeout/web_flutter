import 'package:web_flutter/components/components.dart';

class HomeBloc with BodyMixin {
  int? selectIndex;
  Map<String, dynamic> queryParameters = {};

  @override
  Future onInit() async {
    var sp = await SpUtil.getInstance();
    var selectInde = sp?.getInt("serverIndex");
    selectIndex = selectInde;
    queryParameters = {"serverId": "${selectIndex ?? -1}"};
    return selectIndex ?? -1;
  }
}
