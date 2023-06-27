import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/seo-management/src/components/model.dart';

class OverviewBloc with BodyMixin {
  int selectIndex = 0;

  PagesScope pagesScope = PagesScope();
  UpdateScope updateScope = UpdateScope();

  List<String> list = ["今天", "昨天", "近7天", "高频IP"];
  FileFormatOptions fileFormatOptions = FileFormatOptions.option1;

  List<FileFormaModel> fileFormatList = [
    FileFormaModel(
      "浏览量（pv）",
      FileFormatOptions.option1,
    ),
    FileFormaModel(
      "访客量",
      FileFormatOptions.option2,
    ),
    FileFormaModel(
      "数",
      FileFormatOptions.option3,
    ),
    FileFormaModel(
      "数量",
      FileFormatOptions.option4,
    ),
    FileFormaModel(
      "请求",
      FileFormatOptions.option5,
    ),
    FileFormaModel(
      "实时流量",
      FileFormatOptions.option6,
    ),
    FileFormaModel(
      "每秒请求",
      FileFormatOptions.option6,
    ),
  ];

  void onOverView(int index) {
    selectIndex = index;
    pagesScope.update();
  }
}
