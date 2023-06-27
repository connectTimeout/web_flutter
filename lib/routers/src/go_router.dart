import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/constant.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-login/login.dart';
import 'package:web_flutter/view-pages/src/home/src/home_page.dart';
import 'package:web_flutter/view-login/src/pages/error_page.dart';
import 'package:web_flutter/view-login/src/pages/login_page.dart';
import 'package:web_flutter/view-seo/clone/src/blocs/configuration_bloc.dart';
import 'package:web_flutter/view-seo/clone/src/blocs/parameters_bloc.dart';
import 'package:web_flutter/view-seo/clone/src/blocs/parameters_visible_bloc.dart';
import 'package:web_flutter/view-seo/clone/src/pages/configuration_page.dart';
import 'package:web_flutter/view-seo/clone/src/pages/parameters_page.dart';
import 'package:web_flutter/view-seo/clone/src/pages/parameters_visible_page.dart';
import 'package:web_flutter/view-seo/seo-home/src/blocs/domain_list_bloc.dart';
import 'package:web_flutter/view-seo/seo-home/src/pages/domain_list_page.dart';
import 'package:web_flutter/view-seo/seo.dart';
import 'package:web_flutter/view-seo/site-inclusion/src/blocs/inclusion_bloc.dart';
import 'package:web_flutter/view-seo/site-management/site_management.dart';
import 'package:web_flutter/view-seo/spider/src/blocs/overview_bloc.dart';
import 'package:web_flutter/view-seo/spider/src/pages/high_requency_page.dart';
import 'package:web_flutter/view-seo/spider/src/pages/overview_page.dart';
import 'package:web_flutter/view-seo/spider/src/pages/popular_url_page.dart';
import 'package:web_flutter/view-seo/spider/src/pages/site_summary_page.dart';
import 'package:web_flutter/view-seo/spider/src/pages/spider_statistics_page.dart';
import '../../view-seo/site-inclusion/src/pages/inclusion_page.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> pageNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> pageaNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> serverNavKey = GlobalKey<NavigatorState>();

///网站收录
final GlobalKey<NavigatorState> inclusionNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> inclusionViewNavKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> inclusionTabNavKey =
    GlobalKey<NavigatorState>();

///蜘蛛统计
final GlobalKey<NavigatorState> spiderNavKey = GlobalKey<NavigatorState>();

///克隆配置
final GlobalKey<NavigatorState> configurationNavKey =
    GlobalKey<NavigatorState>();

///功能大全
final GlobalKey<NavigatorState> funAdvertisementNavKey =
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

  ///蜘蛛统计
  static const String overviewPath = "/overview";
  static const String siteSummaryPath = "/site_summary";
  static const String spiderStatisticsPath = "/spider_statistics";
  static const String popularURLPath = "/popular_URL";
  static const String highRequencyPath = "/high_requency";
  static const String configurationPath = "/configuration";
  static const String overviewNamed = "overview";
  static const String siteSummaryNamed = "site_summary";
  static const String spiderStatisticsNamed = "spider_statistics";
  static const String popularURLNamed = "popular_URL";
  static const String highRequencyNamed = "high_requency";
  static const String configurationNamed = "configuration";

  ///克隆配置
  static const String parametersPath = "/parameters";
  static const String parametersNamed = "parameters";

  static const String siteSettings1Path = "/site_settin";
  static const String siteSettings1Named = "site_settin";

  static const String parametersVisiblePath = "/parameters_visible";
  static const String parametersVisibleNamed = "parameters_visible";

  ///功能大全
  static const String funAdvertisementPath = "/fun_advertisement";
  static const String funStatisticsPath = "/fun_statistics";
  static const String funLinkPath = "/fun_link";
  static const String funRemovePath = "/fun_remove";

  static const String funAdvertisementNamed = "fun_advertisement";
  static const String funStatisticsNamed = "fun_statistics";
  static const String funLinkNamed = "fun_link";
  static const String funRemoveNamed = "fun_remove";

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
              return customTransitionPage(
                state: state,
                child: Provider<SEODomainBloc>(
                  create: (_) => SEODomainBloc(),
                  child: SEODomainPage(
                    isView: true,
                    state: state,
                    id: id,
                    child: child,
                  ),
                ),
              );
            },
          ),
          ShellRoute(
            navigatorKey: inclusionNavKey,
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
            pageBuilder: (context, state, child) {
              final args = state.queryParameters["serverId"];
              int id = int.parse(args ?? "0");
              return customTransitionPage(
                state: state,
                child: Provider<SEODomainBloc>(
                  create: (_) => SEODomainBloc(),
                  child: SEODomainPage(
                    routerNamed: siteInclusionNamed,
                    isView: false,
                    state: state,
                    id: id,
                    child: child,
                  ),
                ),
              );
            },
          ),
          ShellRoute(
            navigatorKey: spiderNavKey,
            routes: [
              GoRoute(
                path: overviewPath,
                name: overviewNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<OverviewBloc>(
                      create: (_) => OverviewBloc(),
                      child: const OverviewPage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: siteSummaryPath,
                name: siteSummaryNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<OverviewBloc>(
                      create: (_) => OverviewBloc(),
                      child: const SiteSummaryPage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: spiderStatisticsPath,
                name: spiderStatisticsNamed,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: SpiderStatisticsPage(),
                  );
                },
              ),
              GoRoute(
                path: popularURLPath,
                name: popularURLNamed,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: PopularURLPage(),
                  );
                },
              ),
              GoRoute(
                path: highRequencyPath,
                name: highRequencyNamed,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: HighRequencyPage(),
                  );
                },
              ),
              GoRoute(
                path: configurationPath,
                name: configurationNamed,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: HighRequencyPage(),
                  );
                },
              ),
            ],
            pageBuilder: (context, state, child) {
              final args = state.queryParameters["serverId"];
              int id = int.parse(args ?? "0");
              return customTransitionPage(
                state: state,
                child: Provider<DomainListBloc>(
                  create: (_) => DomainListBloc(),
                  child: DomainListPage(
                    routerNamed: overviewNamed,
                    state: state,
                    id: id,
                    child: child,
                  ),
                ),
              );
            },
          ),
          ShellRoute(
            navigatorKey: funAdvertisementNavKey,
            routes: [
              GoRoute(
                path: funAdvertisementPath,
                name: funAdvertisementNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<FunAdvertisementBloc>(
                      create: (_) => FunAdvertisementBloc(),
                      child: const FunAdvertisementPage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: funStatisticsPath,
                name: funStatisticsNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<FunStatisticsBloc>(
                      create: (_) => FunStatisticsBloc(),
                      child: const FunStatisticsPage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: funLinkPath,
                name: funLinkNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<FunLinkBloc>(
                      create: (_) => FunLinkBloc(),
                      child: const FunLinkPage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: funRemovePath,
                name: funRemoveNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<FunRemoveBloc>(
                      create: (_) => FunRemoveBloc(),
                      child: const FunRemovePage(),
                    ),
                  );
                },
              ),
            ],
            pageBuilder: (context, state, child) {
              final args = state.queryParameters["serverId"];
              int id = int.parse(args ?? "0");
              return customTransitionPage(
                state: state,
                child: Provider<FunctionsBloc>(
                  create: (_) => FunctionsBloc(),
                  child: Functionspage(
                    id: id,
                    state: state,
                    child: child,
                  ),
                ),
              );
            },
          ),
          ShellRoute(
            navigatorKey: configurationNavKey,
            routes: [
              GoRoute(
                path: parametersPath,
                name: parametersNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<ParametersBloc>(
                      create: (_) => ParametersBloc(),
                      child: const ParametersPage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: parametersVisiblePath,
                name: parametersVisibleNamed,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: Provider<ParametersVisibleBloc>(
                      create: (_) => ParametersVisibleBloc(),
                      child: const ParametersVisiblePage(),
                    ),
                  );
                },
              ),
            ],
            pageBuilder: (context, state, child) {
              final args = state.queryParameters["serverId"];
              int id = int.parse(args ?? "0");
              return customTransitionPage(
                state: state,
                child: Provider<ConfigurationBloc>(
                  create: (_) => ConfigurationBloc(),
                  child: ConfigurationPage(
                    id: id,
                    state: state,
                    child: child,
                  ),
                ),
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

CustomTransitionPage customTransitionPage(
    {required GoRouterState state, required Widget child}) {
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
}
