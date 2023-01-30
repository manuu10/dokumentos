import 'package:dokumentos/core/hooks/use_quill_controller.dart';
import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:dokumentos/core/widgets/angled_filepicker.dart';
import 'package:dokumentos/core/widgets/angled_quill_editor.dart';
import 'package:dokumentos/core/widgets/angled_tag_input.dart';
import 'package:dokumentos/core/widgets/angled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart' as q;

class ImportNewDocumentScreen extends HookWidget {
  const ImportNewDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTags = useState(<DocumentTag>[]);
    final controller = useQuillController();
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(right: 20),
          children: [
            Text(
              "Import Document",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Divider(thickness: 3),
            AngledTextField(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: AngledFilePicker(
                onFilesPicked: (d) {},
              ),
            ),
            const SizedBox(height: 20),
            AngledTagInput(
              available: [
                DocumentTag(color: Colors.yellow, title: "Rechnung"),
                DocumentTag(color: Colors.red, title: "Lohnabrechnung"),
                DocumentTag(color: Colors.green, title: "Versicherung"),
                DocumentTag(color: Colors.blue, title: "Vertrag"),
              ],
              selected: selectedTags.value,
              onTap: (tag) {
                if (selectedTags.value
                    .any((element) => element.title == tag.title)) {
                  selectedTags.value = selectedTags.value
                      .where((element) => element.title != tag.title)
                      .toList();
                  return;
                }
                selectedTags.value = [...selectedTags.value, tag];
              },
            ),
            const SizedBox(height: 10),
            Text(
              "Notes",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            AngledQuillEditor(controller: controller),
            const SizedBox(height: 100),
          ],
        ),
      ],
    );
  }
}
