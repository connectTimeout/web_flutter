import 'package:flutter/material.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_tabs.dart';
import 'package:web_flutter/components/common/i_tab_bar/src/i_text_tab_bar.dart';
import 'package:web_flutter/view-pages/src/views/page/3.dart';

List<Tab> get homeList {
  return [
    tabs(title: "网站统计"),
    tabs(title: "网站收录"),
    tabs(title: "蜘蛛统计"),
    tabs(title: "功能大全"),
    tabs(title: "克隆配置"),
  ];
}

class WebsiteSetup extends StatelessWidget {
  const WebsiteSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return ITextTabBar(
      tabsList: homeList,
      children: const [
        one3(),
        one3(),
        one3(),
        one3(),
        one3(),
      ],
    );
  }
}
