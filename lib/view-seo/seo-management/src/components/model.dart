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
  FileFormaModel(this.title, this.type);
}

List<FileFormaModel> fileFormatList = [
  FileFormaModel(
    "html",
    FileFormatOptions.option1,
  ),
  FileFormaModel(
    "php",
    FileFormatOptions.option2,
  ),
  FileFormaModel(
    "jsp",
    FileFormatOptions.option3,
  ),
  FileFormaModel(
    "asp",
    FileFormatOptions.option4,
  ),
  FileFormaModel(
    "aspx",
    FileFormatOptions.option5,
  ),
  FileFormaModel(
    "shtml",
    FileFormatOptions.option6,
  ),
];

List<FileFormaModel> filePCList = [
  FileFormaModel(
    "PC",
    FileFormatOptions.option1,
  ),
  FileFormaModel(
    "手机",
    FileFormatOptions.option2,
  ),
];
