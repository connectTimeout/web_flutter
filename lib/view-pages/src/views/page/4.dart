import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_tabs.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_text_tab_bar.dart';
import 'package:web_flutter/view-pages/src/views/page/3.dart';
import 'package:web_flutter/view-seo/statistics/src/blocs/site_settings_bloc.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';

List<Tab> get homeLists {
  return [
    tabs(title: "网站统计"),
    tabs(title: "网站收录"),
    tabs(title: "蜘蛛统计"),
  ];
}

class one4 extends StatelessWidget {
  const one4({super.key});

  @override
  Widget build(BuildContext context) {
    return ITextTabBar(
      tabsList: homeLists,
      children: [
        Provider(
          create: (_) => SiteSettingsBloc(),
          child: const SiteSettingsPage(),
        ),
        const one3(),
        const one3(),
      ],
    );
  }
}
