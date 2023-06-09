import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-pages/src/views/bloc/home_bloc.dart';
import 'package:web_flutter/components/common/i_button/src/i_elevated_button.dart';
import 'package:web_flutter/view-pages/src/views/page/web_statistics_page.dart';

import '../../../../consts/consts.dart';
import '../../../../routers/src/go_router.dart';
import 'website_setup.dart';
import '3.dart';
import '4.dart';
import '5.dart';

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
                              child: ListView(
                                children: [
                                  ..._buildList(),
                                ],
                              ),
                            ),
                          ),
                          DefaultTabController(
                            length: homeList.length,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: width * 0.84,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TabBar(
                                          padding: const EdgeInsets.all(15),
                                          isScrollable: true,
                                          labelStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          mouseCursor: MouseCursor.defer,
                                          unselectedLabelColor:
                                              Globals.oceanBlue,
                                          indicator: BoxDecoration(
                                            color: Globals.oceanBlue,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          tabs: [...homeList],
                                        ),
                                      ),
                                      IElevatedButton(
                                        "返回主页",
                                        Icons.home_sharp,
                                        onPressed: () {
                                          GoRouter.of(context)
                                              .push(AppRouters.settingPath);
                                        },
                                      ),
                                      IElevatedButton(
                                        "退出登录",
                                        Icons.power_settings_new,
                                        onPressed: () => bloc
                                            .showDeleteConfirmDialog1(context),
                                      ),
                                    ],
                                  ),
                                  const Flexible(
                                    child: TabBarView(
                                      children: [
                                        WebStatisticsPage(),
                                        WebsiteSetup(),
                                        one3(),
                                        one4(),
                                        one5(),
// Body<List<Recruitment>?>(
//   onInit: bloc.onInit,
//   autoKeep: true,
//   controller: bloc.controller,
//   builder: (context, data) {
//     return JKPullRefresh(
//       controller: bloc.refreshController,
//       onRefresh: bloc.onInit,
//       onLoading: bloc.onLoading,
//       empty: data!.isEmpty,
//       child: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (item, index) => RecruitmentCell(
//           onTap: () {},
//           model: data[index],
//         ),
//       ),
//     );
//   },
// ),
// Provider(
//   create: (_) => CreationBloc(),
//   child: const CreationPage(),
// ),
// Provider(
//   create: (_) => CreationBloc(),
//   child: const CreationPage(),
// ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 创建列表 , 每个元素都是一个 ExpansionTile 组件
  List<Widget> _buildList() {
    List<Widget> widgets = [];
    widgets.add(_generateExpansionTileWidget(list));
    return widgets;
  }

  /// 生成 ExpansionTile 组件 , children 是 List<Widget> 组件
  Widget _generateExpansionTileWidget(List<String>? names) {
    int index = names?.length ?? 0;
    return ExpansionTile(
      initiallyExpanded: true,
      leading: const Icon(
        Icons.lan,
        color: Colors.white,
      ),
      title: Text(
        "服务器选择（共$index台）",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      children: names!.map((name) => _generateWidget(name)).toList(),
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
