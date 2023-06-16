import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/home/blocs/seo_home_bloc.dart';

class ITabBarView extends StatelessWidget {
  const ITabBarView(
      {super.key,
      required this.tabList,
      required this.children,
      required this.onPressed});
  final List<TabModel> tabList;
  final List<Widget> children;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 5,
        width: MediaQuery.of(context).size.width * 0.84 - 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    padding: const EdgeInsets.all(15),
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    mouseCursor: MouseCursor.defer,
                    unselectedLabelColor: Globals.oceanBlue,
                    indicator: BoxDecoration(
                      color: Globals.oceanBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    tabs: List.generate(
                      tabList.length,
                      (idx) => Tab(
                        height: 54,
                        icon: Icon(tabList[idx].icon),
                        text: tabList[idx].title,
                        iconMargin: const EdgeInsets.symmetric(horizontal: 30),
                      ),
                    ),
                  ),
                ),
                IElevatedButton(
                  title: "返回主页",
                  icon:  Icons.home_sharp,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouters.settingPath);
                  },
                ),
                IElevatedButton(
                  title: "退出登录",
                  icon:Icons.power_settings_new,
                  onPressed: onPressed,
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                physics: const ClampingScrollPhysics(),
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
