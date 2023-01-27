import 'package:dokumentos/app/import_new_document.screen.dart';
import 'package:dokumentos/app/overview.screen.dart';
import 'package:dokumentos/core/buttons/angled_corner_button.dart';
import 'package:dokumentos/core/router/router.dart';
import 'package:dokumentos/core/sidemenu/sidemenu.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.body}) : super(key: key);

  final Widget? body;

  Color? resolveColor(bool active) =>
      active ? Colors.purple.withOpacity(0.3) : null;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            footer: AngledCornerButton(
              borderHoverColor: Colors.grey,
              backgroundColor:
                  resolveColor(router.location == AppRouter.rSettings),
              child: const Text("Settings"),
              onTap: () => context.go(AppRouter.rSettings),
            ),
            children: [
              AngledCornerButton(
                connectTop: true,
                borderHoverColor: Colors.purple,
                backgroundColor:
                    resolveColor(router.location == AppRouter.rImportDoc),
                onTap: () => context.go(AppRouter.rImportDoc),
                child: const Text("Import new Document"),
              ),
              const SizedBox(height: 10),
              AngledCornerButton(
                borderHoverColor: Colors.purple,
                backgroundColor:
                    resolveColor(router.location == AppRouter.rMain),
                child: const Text("Home"),
                onTap: () => context.go(AppRouter.rMain),
              ),
              const SizedBox(height: 10),
              AngledCornerButton(
                connectBottom: true,
                borderHoverColor: Colors.purple,
                backgroundColor: resolveColor(false),
                child: const Text("dingsdongs"),
                onTap: () {},
              )
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: body ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
