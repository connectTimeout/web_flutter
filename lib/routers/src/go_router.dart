import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/common/constant.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/view-pages/page.dart';
import 'package:web_flutter/view-seo/seo.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';
import 'package:web_flutter/view-seo/view/blocs/add_account_bloc.dart';
import 'package:web_flutter/view-seo/view/blocs/add_server_bloc.dart';
import 'package:web_flutter/view-seo/view/blocs/complaint_bloc.dart';
import 'package:web_flutter/view-seo/view/blocs/reason_deleton_bloc.dart';
import 'package:web_flutter/view-seo/view/pages/add_account_page.dart';
import 'package:web_flutter/view-seo/view/pages/add_server_page.dart';
import 'package:web_flutter/view-seo/view/pages/complaint_page.dart';
import 'package:web_flutter/view-seo/view/pages/reason_deleton_page.dart';

import 'router_key.dart';

class AppRouters {
  /// 用于路径路由(声明式路由)的常量, 路径不包含参数
  static const String homePath = '/'; // 根路由
  static const String login = '/login';
  static const String complaintPath = '/complaint';
  static const String addServerPath = '/add_server';
  static const String reasonDeletonPath = '/reason_deleton';
  static const String addAccountPath = '/add_account';

  /// 用于 命名路由的常量
  static const String homeNamed = 'home_page';
  static const String loginNamed = 'login_page';
  static const String complaintNamed = 'complaint';
  static const String addServerNamed = 'add_server';
  static const String reasonDeletonNamed = 'reason_deleton';
  static const String addAccountNamed = 'add_account';

  ///网站管理
  ///path
  static const String siteSettingsPath = "/site_settings";
  static const String friendlyLinksPath = "/friendly_links";
  static const String nginxConfigPath = "/nainx_config";
  static const String statisticsPath = "/statistics";
  static const String advertisingPath = "/advertising";
  static const String templatePath = "/template";

  ///named
  static const String siteSettingsNamed = "site_settings";
  static const String friendlyLinksNamed = "friendly_links";
  static const String nginxConfigNamed = "nainx_config";
  static const String statisticsNamed = "statistics";
  static const String advertisingNamed = "advertising";
  static const String templateNamed = "template";

  static GoRouter router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: homePath,
    // 默认路由, 不指定这一荐时，默认路由为 '/'
    routes: [
      GoRoute(
          // 不传递参数的路由项
          name: homeNamed, // 命名路由
          path: homePath, // 路径路由
          // builder: (context, state) {
          //   return Provider<HomeBloc>(
          //     create: (_) => HomeBloc(),
          //     child: const HomePage(),
          //   );
          // },
          pageBuilder: (BuildContext context, GoRouterState state) {
            return customTransitionPage(
                child: Provider<HomeBloc>(
                  create: (_) => HomeBloc(),
                  child: const HomePage(),
                ),
                state: state);
          }),
      ShellRoute(
        navigatorKey: seoNavKey,
        routes: [
          GoRoute(
            path: complaintPath,
            name: complaintNamed,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: Provider<ComplaintBloc>(
                  create: (_) => ComplaintBloc(),
                  child: const ComplaintPage(),
                ),
              );
            },
          ),
          GoRoute(
            path: addAccountPath,
            name: addAccountNamed,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: Provider<AddAccountBloc>(
                  create: (_) => AddAccountBloc(),
                  child: const AddAccountPage(),
                ),
              );
            },
          ),
          // ShellRoute(
          //   navigatorKey: serverNavKey,
          //   routes: [
          //     GoRoute(
          //       path: siteSettingsPath,
          //       name: siteSettingsNamed,
          //       pageBuilder: (context, state) {
          //         return NoTransitionPage(
          //           child: Provider<SiteSettingsBloc>(
          //             create: (_) => SiteSettingsBloc(),
          //             child: const SiteSettingsPage(),
          //           ),
          //         );
          //       },
          //     ),
          //     GoRoute(
          //       path: friendlyLinksPath,
          //       name: friendlyLinksNamed,
          //       pageBuilder: (context, state) {
          //         return NoTransitionPage(
          //           child: Provider<FriendlyLinksBloc>(
          //             create: (_) => FriendlyLinksBloc(),
          //             child: const FriendlyLinksPage(),
          //           ),
          //         );
          //       },
          //     ),
          //     GoRoute(
          //       path: nginxConfigPath,
          //       name: nginxConfigNamed,
          //       pageBuilder: (context, state) {
          //         return NoTransitionPage(
          //           child: Provider<NginxConfigBloc>(
          //             create: (_) => NginxConfigBloc(),
          //             child: const NginxConfigPage(),
          //           ),
          //         );
          //       },
          //     ),
          //     GoRoute(
          //       path: statisticsPath,
          //       name: statisticsNamed,
          //       pageBuilder: (context, state) {
          //         return NoTransitionPage(
          //           child: Provider<StatisticsCodeBloc>(
          //             create: (_) => StatisticsCodeBloc(),
          //             child: const StatisticsCodePage(),
          //           ),
          //         );
          //       },
          //     ),
          //     GoRoute(
          //       path: advertisingPath,
          //       name: advertisingNamed,
          //       pageBuilder: (context, state) {
          //         return NoTransitionPage(
          //           child: Provider<AdvertisementSettingBloc>(
          //             create: (_) => AdvertisementSettingBloc(),
          //             child: const AdvertisementSettingPage(),
          //           ),
          //         );
          //       },
          //     ),
          //     GoRoute(
          //       path: templatePath,
          //       name: templateNamed,
          //       pageBuilder: (context, state) {
          //         return NoTransitionPage(
          //           child: Provider<TemplateCodeBloc>(
          //             create: (_) => TemplateCodeBloc(),
          //             child: const TemplateCodePage(),
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          //   builder: (context, state, child) {
          //     final index = state.queryParameters["serverId"];
          //     DomainNameModel args;
          //     if (state.extra == null) {
          //       var model = DomainNameModel(
          //         "",
          //         NavigationDrawerType.http,
          //         "",
          //       );
          //       args = model;
          //     } else {
          //       args = state.extra as DomainNameModel;
          //     }
          //     int id = int.parse(index ?? "0");
          //     return Provider<SEOTabBarBloc>(
          //       create: (_) => SEOTabBarBloc(),
          //       child: SEOTabBarPage(
          //         state: state,
          //         id: id,
          //         model: args,
          //         child: child,
          //       ),
          //     );
          //   },
          // ),

          GoRoute(
            path: addServerPath,
            name: addServerNamed,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: Provider<AddServerBloc>(
                  create: (_) => AddServerBloc(),
                  child: const AddServerPage(),
                ),
              );
            },
          ),
          GoRoute(
            path: reasonDeletonPath,
            name: reasonDeletonNamed,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: Provider<ReasonDeletonBloc>(
                  create: (_) => ReasonDeletonBloc(),
                  child: const ReasonDeletonPage(),
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
