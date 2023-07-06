import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/model/src/user_model_entity.dart';
import 'package:web_flutter/net-work/src/api/src/home_request.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';

class SiteSettingsBloc with BodyMixin<List<UserModelEntity>> {
  late List<UserModelEntity> listModel;
  @override
  Future<List<UserModelEntity>> onInit() async {
    try {
      listModel = [];
      await onLoading();
      return listModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserModelEntity>> onLoading() async {
    try {
      var res = await HomeRequest.getUser();
      listModel.addAll(res!);
      controller.withData(listModel);
      return listModel;
    } catch (e) {
      rethrow;
    }
  }

  final TextEditingController domainController = TextEditingController();
  final TextEditingController serverController = TextEditingController();
  int rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  List<String> titleList = [
    "ID",
    "域名",
    "昵称",
    "账号类型",
    "账号状态",
    "登录IP",
    "登录时间",
    "开户时间",
    "操作",
  ];

  List<EmployeTableModel> modelList = [
    EmployeTableModel(
      "shoper",
      "电商",
      "0",
      "0",
      "223.65.44.6",
      "2023-06-30",
      "2023-02-08",
    ),
    EmployeTableModel(
      "ac2020",
      "ac2020",
      "1",
      "1",
      "223.65.44.6",
      "2023-06-30",
      "2023-02-08",
    ),
  ];

  void onPerPage(int? newRowsPerPage) {
    if (newRowsPerPage != null) {
      rowsPerPage = newRowsPerPage;
    }
    pageScope.update();
  }

  PagesScope pageScope = PagesScope();
  final TextEditingController controllerOutlined = TextEditingController();
  final TextEditingController checkController = TextEditingController();
  final TextEditingController analysisController = TextEditingController();

  ///首页标题
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController innerTitleController = TextEditingController();

  ///首页关键词
  final TextEditingController keyworController = TextEditingController();
  final TextEditingController innerKeywordController = TextEditingController();

  ///首页描述
  final TextEditingController descriptController = TextEditingController();
  final TextEditingController innerDescriptController = TextEditingController();
  bool onCensorOffstage = true;
  bool isCheckedW = false;
  bool isChecked = false;
  bool isCheckedM = false;
  bool iSwitch = true;

  ///file
  List<ModelPage> configureList = [
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(true, "minaho"),
    ModelPage(false, "minaho"),
  ];

  ModelPage? values;

  HttpOptions groupValueOption = HttpOptions.option1;
  FileFormatOptions fileFormatOptions = FileFormatOptions.option1;

  void onController() {
    checkController.clear();
  }

  void onSwitch(bool? value) {
    iSwitch = value!;
    pageScope.update();
  }

  ///"开启反审查" : "关闭反审查"
  void onCensorEvent() {
    onCensorOffstage = !onCensorOffstage;

    pageScope.update();
  }

  ///禁用站点
  void onDisablePressed() {}

  ///保存修改
  void onSavePressed() {}

  void onChangedChanged(bool? value) {
    isChecked = value!;
    pageScope.update();
  }

  void onChangedWChanged(bool? value) {
    isCheckedW = value!;
    pageScope.update();
  }

  void onChangedMChanged(bool? value) {
    isCheckedM = value!;
    pageScope.update();
  }

  void onChanged(HttpOptions? value) {
    groupValueOption = value!;
    pageScope.update();
  }

  void onFileChanged(FileFormatOptions? value) {
    fileFormatOptions = value!;
    pageScope.update();
  }

  ///ip解析
  bool automaticParsing = true;
  void onAutomaticParsing(bool? value) {
    automaticParsing = value!;
    pageScope.update();
  }

  ///重新解析
  void onReanalysis() {}

  ///效验解析
  void onValidationAnalysis() {}
}
