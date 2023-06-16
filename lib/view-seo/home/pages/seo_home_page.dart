import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-seo/home/blocs/seo_home_bloc.dart';
import 'package:web_flutter/view-seo/home/components/i_tab_bar_view.dart';
import 'package:web_flutter/view-seo/home/pages/drawer_page.dart';

import '../../../view-pages/src/views/page/3.dart';
import '../../../view-pages/src/views/page/5.dart';
import 'seo_tabar_view.dart';
import 'web_statistics_page.dart';

const List<String> list = [
  "103.146.158.58 - 103.146.158.58",
  "电商-01 - 156.233.143.202",
  "电商-01 - 156.233.143.202",
];

List<Tab> get homeList {
  return [
    tab(icon: const Icon(Icons.personal_video), title: "网站统计"),
    tab(icon: const Icon(Icons.upload_file), title: "网站收录"),
    tab(icon: const Icon(Icons.assessment), title: "蜘蛛统计"),
    tab(icon: const Icon(Icons.settings), title: "功能大全"),
    tab(icon: const Icon(Icons.content_copy), title: "克隆配置"),
  ];
}

Tab tab({
  required Icon icon,
  required String title,
}) {
  return Tab(
    height: 54,
    icon: icon,
    text: title,
    iconMargin: const EdgeInsets.symmetric(horizontal: 30),
  );
}

BorderSide borderSide = const BorderSide(color: Colors.yellow, width: 3.0);
bool onHover = false;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Color get colors {
    return onHover ? Colors.white : Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<HomeBloc>(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Body(
        child: Stack(
          children: [
            const Positioned.fill(
              child: INetworkImage(
                fit: BoxFit.cover,
                placeholder: ImgAsset.beijing,
              ),
            ),
            border(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    border(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "狂侠站群系统",
                              style:
                                  TextStyle(color: Theme.of(context).cardColor),
                            ),
                            Expanded(
                                child: Align(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).highlightColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.amberAccent, width: 0.5)),
                                child: const Text("电商-01 - 156.233.143.202",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )),
                            const INetworkImage(
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              borderRadius: 10,
                              placeholder: ImgAsset.profile,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "nihao",
                              style:
                                  TextStyle(color: Theme.of(context).cardColor),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.circle_notifications,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    border(
                      top: BorderSide.none,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          border(
                            top: BorderSide.none,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: width * 0.16,
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                leading: const Icon(
                                  Icons.lan,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  "服务器选择（共${list.length}台）",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                children: list
                                    .map((e) => _generateWidget(e))
                                    .toList(),
                              ),
                            ),
                          ),
                          ITabBarView(
                            tabList: bloc.homeList,
                            children: const [
                              WebStatisticsPage(),
                              one3(),
                              SeoTabarView(),
                              TemplateDesktopPage(),
                              TemplateDesktopPage(),
                            ],
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 生成 ExpansionTile 下的 ListView 的单个组件
  Widget _generateWidget(name) {
    /// 使用该组件可以使宽度撑满
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(bottom: 5, right: 10),
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Widget border({
    required Widget child,
    BorderSide? top,
    BorderSide? right,
    BorderSide? bottom,
    BorderSide? left,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: top ??= borderSide,
          right: right ??= borderSide,
          bottom: bottom ??= borderSide,
          left: left ??= borderSide,
        ),
      ),
      child: child,
    );
  }
}
