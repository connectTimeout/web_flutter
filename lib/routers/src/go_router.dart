import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/view-seo/seo.dart';

import 'router_key.dart';

class AppRouters {
  /// 用于路径路由(声明式路由)的常量, 路径不包含参数
  static const String homePath = '/'; // 根路由
  static const String addServerPath = '/add_server';
  static const String reasonDeletonPath = '/reason_deleton';
  static const String addAccountPath = '/add_account';
  static const String addReasonPath = '/add_reason';

  /// 用于 命名路由的常量
  static const String complaintNamed = 'complaint';
  static const String addServerNamed = 'add_server';
  static const String reasonDeletonNamed = 'reason_deleton';
  static const String addAccountNamed = 'add_account';
  static const String addReasonNamed = 'add_reason';

  static GoRouter router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: homePath,
    // 默认路由, 不指定这一荐时，默认路由为 '/'
    routes: [
      ShellRoute(
        navigatorKey: seoNavKey,
        routes: [
          GoRoute(
            path: homePath,
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
          GoRoute(
            path: addReasonPath,
            name: addReasonNamed,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: Provider<AddReasonBloc>(
                  create: (_) => AddReasonBloc(),
                  child: const AddReasonPage(),
                ),
              );
            },
          ),
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
          return Provider<SEOHomeBloc>(
            create: (_) => SEOHomeBloc(),
            child: SeoHomePage(
              state: state,
              child: child,
            ),
          );
        },
      ),
    ],

    errorBuilder: (context, GoRouterState state) {
      return const ErrorPage();
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
