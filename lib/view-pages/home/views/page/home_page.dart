import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/common/animated_button.dart';
import 'package:web_flutter/utils/utils.dart';

import '../../../../components/components.dart';
import '../../../../routers/src/go_router.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: INetworkImage(
              fit: BoxFit.cover,
              placeholder: ImgAsset.beijing,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedButton(
                value: "SEO工作台",
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.homePath);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              showNavigationDrawer!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedButton(
                          value: "系统设置",
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.homePath);
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        AnimatedButton(
                          value: "管理员",
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.homePath);
                          },
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        AnimatedButton(
                          value: "系统设置",
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.homePath);
                          },
                        ),
                        const SizedBox(
                          height: 40,
                          width: 600,
                        ),

                        AnimatedButton(
                          value: "管理员",
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.homePath);
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 620;
  }

}
