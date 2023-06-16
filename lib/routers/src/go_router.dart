import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/constant.dart';
import 'package:web_flutter/view-pages/src/home/src/home_page.dart';
import 'package:web_flutter/view-login/src/pages/error_page.dart';
import 'package:web_flutter/view-login/src/pages/login_page.dart';
import 'package:web_flutter/view-seo/home/blocs/bbb.dart';
import 'package:web_flutter/view-seo/home/blocs/seo_home_bloc.dart';
import 'package:web_flutter/view-seo/home/components/drawer_model.dart';
import 'package:web_flutter/view-seo/home/pages/seo_home_page.dart';
import 'package:web_flutter/view-seo/statistics/statistics.dart';
import '../../view-pages/view.dart';
import '../../view-seo/home/pages/bbb.dart';

class AppRouters {
// 用于路径路由(声明式路由)的常量, 路径不包含参数
  static const String homePath = '/'; // 根路由
  static const String settingPath = '/settings';
  static const String sitePath = '/site';
  static const String login = '/login';
  static const String bbbPath = '/bbb';
  static const String bbbNamed = 'bbb';

// 用于 命名路由的常量
  static const String homeNamed = 'home_page';
  static const String settingsNamed = 'setting_page';
  static const String siteNamed = 'site';
  static const String loginNamed = 'login_page';

  static GoRouter router = GoRouter(
    initialLocation: homePath, // 默认路由, 不指定这一荐时，默认路由为 '/'
    routes: [
      goRoute(
        // 不传递参数的路由项
        name: homeNamed, // 命名路由
        path: homePath, // 路径路由
        child: const HomePages(),
      ),
      goRoute(
        name: settingsNamed,
        path: settingPath,
        child: Provider<HomeBloc>(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      ),
      GoRoute(
        name: bbbNamed,
        path: bbbPath,
        builder: (context, state) {
          final model = state.extra as DrawerModel;
          return Provider<BBBBloc>(
            create: (_) => BBBBloc(model),
            child: const BBB(),
          );
        },
      ),
      GoRoute(
        name: loginNamed,
        path: login,
        builder: (context, state) {
          return Provider<LoginBloc>(
            create: (_) => LoginBloc(),
            child: LoginPage(
              location: state.queryParameters['location'],
              text: state.queryParameters['text'],
            ),
          );
        },
      ),
    ],

    errorBuilder: (context, GoRouterState state) {
      return const ErrorPage();
    },
    redirect: (context, state) {
      debugPrint('loginRedirect: ${state.name}');
      final loggingIn = state.matchedLocation == '/login';
      //如果没登录,并且当前不在登录页面,去登录 (并将本来想要跳转的页面传递到登录页)
      if (!Constant.login && !loggingIn) {
        // return state.namedLocation(loginNamed);
      }
      return null;
    },
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
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
            child: child,
          );
        },
      );
    },
  );
}
