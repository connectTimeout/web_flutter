import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/constant.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-pages/src/home/src/home_page.dart';
import 'package:web_flutter/view-login/src/pages/error_page.dart';
import 'package:web_flutter/view-login/src/pages/login_page.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/seo_domain_bloc.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/seo_home_bloc.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/seo_tabbar_bloc.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';
import 'package:web_flutter/view-seo/seo-home/src/pages/seo_domain_page.dart';
import 'package:web_flutter/view-seo/seo-home/src/pages/seo_home_page.dart';
import 'package:web_flutter/view-seo/seo-home/src/pages/seo_tabbar_page.dart';
import 'package:web_flutter/view-seo/site-inclusion/src/blocs/inclusion_bloc.dart';
import 'package:web_flutter/view-seo/site-management/site_management.dart';
import '../../view-pages/view.dart';
import '../../view-seo/site-inclusion/src/pages/inclusion_page.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> pageNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> pageaNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> serverNavKey = GlobalKey<NavigatorState>();

///网站收录
final GlobalKey<NavigatorState> inclusionNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> inclusionViewNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> inclusionTabNavKey =
    GlobalKey<NavigatorState>();

class AppRouters {
  /// 用于路径路由(声明式路由)的常量, 路径不包含参数
  static const String homePath = '/'; // 根路由
  static const String login = '/login';

  ///网站管理
  ///path
  static const String siteSettingsPath = "/site_settings";
  static const String friendlyLinksPath = "/friendly_links";
  static const String nginxConfigPath = "/nainx_config";
  static const String statisticsPath = "/statistics";
  static const String advertisingPath = "/advertising";
  static const String templatePath = "/template";

  /// 用于 命名路由的常量
  static const String homeNamed = 'home_page';
  static const String loginNamed = 'login_page';

  ///named
  static const String siteSettingsNamed = "site_settings";
  static const String friendlyLinksNamed = "/friendly_links";
  static const String nginxConfigNamed = "/nainx_config";
  static const String statisticsNamed = "/statistics";
  static const String advertisingNamed = "/advertising";
  static const String templateNamed = "/template";

  ///网站收录
  static const String siteInclusionPath = "/site_inclusion";
  static const String siteInclusionNamed = "site_inclusion";

  static const String siteSettings1Path = "/site_settin";
  static const String siteSettings1Named = "site_settin";

  static GoRouter router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: homePath,
    // 默认路由, 不指定这一荐时，默认路由为 '/'
    routes: [
      goRoute(
        // 不传递参数的路由项
        name: homeNamed, // 命名路由
        path: homePath, // 路径路由
        child: const HomePages(),
      ),
      ShellRoute(
        navigatorKey: shellNavKey,
        routes: [
          ShellRoute(
            navigatorKey: pageNavKey,
            routes: [
              ShellRoute(
                navigatorKey: serverNavKey,
                routes: [
                  GoRoute(
                    path: siteSettingsPath,
                    name: siteSettingsNamed,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Provider<SiteSettingsBloc>(
                          create: (_) => SiteSettingsBloc(),
                          child: const SiteSettingsPage(),
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: friendlyLinksPath,
                    name: friendlyLinksNamed,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Provider<FriendlyLinksBloc>(
                          create: (_) => FriendlyLinksBloc(),
                          child: const FriendlyLinksPage(),
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: nginxConfigPath,
                    name: nginxConfigNamed,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Provider<NginxConfigBloc>(
                          create: (_) => NginxConfigBloc(),
                          child: const NginxConfigPage(),
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: statisticsPath,
                    name: statisticsNamed,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Provider<StatisticsCodeBloc>(
                          create: (_) => StatisticsCodeBloc(),
                          child: const StatisticsCodePage(),
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: advertisingPath,
                    name: advertisingNamed,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Provider<AdvertisementSettingBloc>(
                          create: (_) => AdvertisementSettingBloc(),
                          child: const AdvertisementSettingPage(),
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: templatePath,
                    name: templateNamed,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Provider<TemplateCodeBloc>(
                          create: (_) => TemplateCodeBloc(),
                          child: const TemplateCodePage(),
                        ),
                      );
                    },
                  ),
                ],
                builder: (context, state, child) {
                  final index = state.queryParameters["serverId"];
                  DomainNameModel args;
                  if (state.extra == null) {
                    var model = DomainNameModel(
                      "",
                      NavigationDrawerType.http,
                      "",
                    );
                    args = model;
                  } else {
                    args = state.extra as DomainNameModel;
                  }
                  int id = int.parse(index ?? "0");
                  return Provider<SEOTabBarBloc>(
                    create: (_) => SEOTabBarBloc(),
                    child: SEOTabBarPage(
                      state: state,
                      id: id,
                      model: args,
                      child: child,
                    ),
                  );
                },
              ),
            ],
            pageBuilder: (context, state, child) {
              final args = state.queryParameters["serverId"];
              int id = int.parse(args ?? "0");
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: Provider<SEODomainBloc>(
                  create: (_) => SEODomainBloc(),
                  child: SEODomainPage(
                    state: state,
                    id: id,
                    child: child,
                  ),
                ),
                transitionDuration: const Duration(milliseconds: 50),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          ShellRoute(
            navigatorKey: inclusionNavKey,
            routes: [
              ShellRoute(
                navigatorKey: inclusionTabNavKey,
                routes: [
                  GoRoute(
                    path: siteInclusionPath,
                    name: siteInclusionNamed,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Provider<InclusionBloc>(
                          create: (_) => InclusionBloc(),
                          child: const InclusionPage(),
                        ),
                      );
                    },
                  ),
                ],
                builder: (context, state, child) {
                  final index = state.queryParameters["serverId"];
                  DomainNameModel args;
                  if (state.extra == null) {
                    var model = DomainNameModel(
                      "",
                      NavigationDrawerType.http,
                      "",
                    );
                    args = model;
                  } else {
                    args = state.extra as DomainNameModel;
                  }
                  int id = int.parse(index ?? "0");
                  return Provider<SEOTabBarBloc>(
                    create: (_) => SEOTabBarBloc(),
                    child: SEOTabBarPage(
                      state: state,
                      id: id,
                      model: args,
                      child: child,
                    ),
                  );
                },
              ),
            ],
            pageBuilder: (context, state, child) {
              final args = state.queryParameters["serverId"];
              int id = int.parse(args ?? "0");
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: Provider<SEODomainBloc>(
                  create: (_) => SEODomainBloc(),
                  child: SEODomainPage(
                    state: state,
                    id: id,
                    child: child,
                  ),
                ),
                transitionDuration: const Duration(milliseconds: 50),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: siteSettings1Path,
            name: siteSettings1Named,
            pageBuilder: (context, state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: Provider<NginxConfigBloc>(
                  create: (_) => NginxConfigBloc(),
                  child: const NginxConfigPage(),
                ),
                transitionDuration: const Duration(milliseconds: 150),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
        builder: (context, state, child) {
          final args = state.queryParameters["serverId"];
          int id = int.parse(args ?? "0");
          return Provider<SEOHomeBloc>(
            create: (_) => SEOHomeBloc(),
            child: SeoHomePage(
              state: state,
              id: id,
              child: child,
            ),
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
