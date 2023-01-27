import 'package:dokumentos/app/import_new_document.screen.dart';
import 'package:dokumentos/app/overview.screen.dart';
import 'package:dokumentos/app/settings.screen.dart';
import 'package:dokumentos/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const rMain = "/main";
  static const rImportDoc = "/importDoc";
  static const rSettings = "/settings";

  static final router = GoRouter(
    initialLocation: rMain,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomeScreen(body: child);
        },
        routes: [
          GoRoute(
            path: rMain,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: const OverviewScreen()),
          ),
          GoRoute(
            path: rImportDoc,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: const ImportNewDocumentScreen()),
          ),
          GoRoute(
            path: rSettings,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: const SettingsScreen()),
          )
        ],
      )
    ],
  );

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
