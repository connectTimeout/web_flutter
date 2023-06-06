import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-pages/home/views/bloc/home_bloc.dart';
// import 'package:provider/provider.dart';

import '../../view-pages/home/views/page/home.dart';
import '../../view-pages/home/views/page/home_page.dart';

class AppRoutes {
  // 用于路径路由(声明式路由)的常量, 路径不包含参数
  static const String homePath = '/'; // 根路由
  static const String settingPath = '/settings';

  // 用于 命名路由的常量
  static const String homeNamed = 'home_page';
  static const String settingsNamed = 'setting_page';

  static GoRouter router = GoRouter(
    initialLocation: homePath, // 默认路由, 不指定这一荐时，默认路由为 '/'
    routes: [
      goRoute(
        // 不传递参数的路由项
        name: homeNamed, // 命名路由
        path: homePath, // 路径路由
        child: Provider<HomeBloc>(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      ),
      goRoute(
        name: settingsNamed,
        path: settingPath,
        child: const HomePages(),
      ),
    ],
  );
}

RouteBase goRoute({String? name, required String path, required Widget child}) {
  return GoRoute(
    name: name,
    path: path,
    pageBuilder: (context, state) {
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 150),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
            child: child,
          );
        },
      );
    },
  );
}
