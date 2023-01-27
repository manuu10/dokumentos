import 'package:dokumentos/app/import_new_document.screen.dart';
import 'package:dokumentos/app/overview.screen.dart';
import 'package:dokumentos/app/settings.screen.dart';
import 'package:dokumentos/home.screen.dart';
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
            builder: (context, state) => const OverviewScreen(),
          ),
          GoRoute(
            path: rImportDoc,
            builder: (context, state) => const ImportNewDocumentScreen(),
          ),
          GoRoute(
            path: rSettings,
            builder: (context, state) => const SettingsScreen(),
          )
        ],
      )
    ],
  );
}
