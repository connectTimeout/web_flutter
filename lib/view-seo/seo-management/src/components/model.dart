import 'package:web_flutter/consts/consts.dart';

class ModelPage {
  final bool value;
  final String title;
  ModelPage(this.value, this.title);
}

class ICheckboxModel {
  late final bool type;
  final String value;
  ICheckboxModel(this.type, this.value);
}

class FileFormaModel {
  final String title;
  final dynamic type;
  final String value;
  FileFormaModel(this.title, this.type, this.value);
}

List<FileFormaModel> tableFormatList = [
  FileFormaModel("搜索展现和实际不一致", FileFormatOptions.option3, "account"),
  FileFormaModel("侵犯个人隐私", FileFormatOptions.option4, "server"),
  FileFormaModel("色情暴力", FileFormatOptions.option5, "task"),
  FileFormaModel("未成年有害信息", FileFormatOptions.option10, "reason"),
];
List<FileFormaModel> fileFormatList = [
  FileFormaModel("搜索展现和实际不一致", FileFormatOptions.option3, "3"),
  FileFormaModel("侵犯个人隐私", FileFormatOptions.option4, "4"),
  FileFormaModel("色情暴力", FileFormatOptions.option5, "5"),
  FileFormaModel("未成年有害信息", FileFormatOptions.option10, "10"),
];
