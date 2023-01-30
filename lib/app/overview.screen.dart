import 'package:dokumentos/core/buttons/angled_corner_button.dart';
import 'package:dokumentos/core/widgets/angled_tag_input.dart';
import 'package:dokumentos/model/document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 20),
      children: [
        Text(
          "Home",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(thickness: 3),
        for (final d in DocDings.demo) DocDingsTile(d)
      ],
    );
  }
}

class DocDingsTile extends HookWidget {
  const DocDingsTile(this.doc, {Key? key}) : super(key: key);
  final DocDings doc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AngledCornerButton(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            AngledTagView(tags: doc.tags),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FeatherIcons.file,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 10),
                Text("${doc.countFiles} Files")
              ],
            )
          ],
        ),
      ),
    );
  }
}
