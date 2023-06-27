import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

class FunLinkBloc with BodyMixin {
  PagesScope pageScope = PagesScope();
  HttpOptions groupValueOption = HttpOptions.option1;
  void onChanged(HttpOptions? value) {
    groupValueOption = value!;
    pageScope.update();
  }

  List<ITextRadioModel> linksList = [
    ITextRadioModel(
      HttpOptions.option1,
      "不显示",
    ),
    ITextRadioModel(
      HttpOptions.option2,
      "首页",
    ),
    ITextRadioModel(
      HttpOptions.option3,
      "首页和内页全站",
    ),
  ];
}
