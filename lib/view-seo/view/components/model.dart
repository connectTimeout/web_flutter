import 'package:web_flutter/consts/consts.dart';

class FileFormaModel {
  final String title;
  final dynamic type;
  final String value;
  FileFormaModel(this.title, this.type, this.value);
}

List<FileFormaModel> tableFormatList = [
  FileFormaModel("百度账号", FileFormatOptions.option3, "account"),
  FileFormaModel("服务器", FileFormatOptions.option4, "server"),
  FileFormaModel("任务信息", FileFormatOptions.option5, "task"),
  FileFormaModel("投诉理由", FileFormatOptions.option10, "reason"),
];
List<FileFormaModel> fileFormatList = [
  FileFormaModel("搜索展现和实际不一致", FileFormatOptions.option3, "3"),
  FileFormaModel("侵犯个人隐私", FileFormatOptions.option4, "4"),
  FileFormaModel("色情暴力", FileFormatOptions.option5, "5"),
  FileFormaModel("未成年有害信息", FileFormatOptions.option10, "10"),
];
