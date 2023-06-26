import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/seo_home.dart';

class ConfigurationBloc with BodyMixin {
  List<SEOTabBarModel> tabNameList = [
    SEOTabBarModel(AppRouters.parametersNamed, title: "克隆参数"),
    SEOTabBarModel(AppRouters.parametersVisibleNamed, title: "参数可见"),
  ];
  int selectIndex = 0;

  PagesScope pageScope = PagesScope();

  void onPressed(
    BuildContext context,
    int index,
    SEOTabBarModel? model,
  ) {
    selectIndex = index;
    context.goNamed(
      model?.namePath ?? AppRouters.siteSettingsNamed,
      queryParameters: {
        'ids': "${index + 20}",
      },
    );
  }
}
