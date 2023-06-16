import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_tabs.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_text_tab_bar.dart';
import 'package:web_flutter/view-seo/statistics/src/blocs/site_settings_bloc.dart';

import 'package:web_flutter/view-seo/statistics/src/pages/site_settings.dart';

List<Tab> get homeList {
  return [
    tabs(title: "网站统计"),
  ];
}

class WebsiteSetup extends StatelessWidget {
  const WebsiteSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return ITextTabBar(
      tabsList: homeList,
      children: [
        Provider(
          create: (_) => SiteSettingsBloc(),
          child: const SiteSettingsPage(),
        ),
      ],
    );
  }
}
