import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_tabs.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_text_tab_bar.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

List<Tab> get homeLists {
  return [
    tabs(title: "网站设置"),
    tabs(title: "友情链接"),
    tabs(title: "广告设置"),
    tabs(title: "统计代码"),
    tabs(title: "模版代码"),
    tabs(title: "Nainx配置"),
  ];
}

class SeoTabarView extends StatelessWidget {
  const SeoTabarView({super.key});
  @override
  Widget build(BuildContext context) {
    return ITextTabBar(
      tabsList: homeLists,
      children: [
        Provider(
          create: (_) => SiteSettingsBloc(),
          child: const SiteSettingsPage(),
        ),
        Provider(
          create: (_) => FriendlyLinksBloc(),
          child: const FriendlyLinksPage(),
        ),
        Provider(
          create: (_) => AdvertisementSettingBloc(),
          child: const AdvertisementSettingPage(),
        ),
        Provider(
          create: (_) => StatisticsCodeBloc(),
          child: const StatisticsCodePage(),
        ),
        Provider(
          create: (_) => TemplateCodeBloc(),
          child: const TemplateCodePage(),
        ),
        Provider(
          create: (_) => NginxConfigBloc(),
          child: const NginxConfigPage(),
        ),
      ],
    );
  }
}
