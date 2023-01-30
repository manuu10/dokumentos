import 'package:dokumentos/core/buttons/angled_corner_button.dart';
import 'package:dokumentos/core/hooks/use_quill_controller.dart';
import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:dokumentos/core/widgets/angled_filepicker.dart';
import 'package:dokumentos/core/widgets/angled_quill_editor.dart';
import 'package:dokumentos/core/widgets/angled_tag_input.dart';
import 'package:dokumentos/core/widgets/angled_text_field.dart';
import 'package:dokumentos/model/document.dart';
import 'package:dokumentos/model/document_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ImportNewDocumentScreen extends HookWidget {
  const ImportNewDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTags = useState(<DocDingsTag>[]);
    final controller = useQuillController();
    final titleController = useTextEditingController();
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
            AngledTextField(controller: titleController),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: AngledFilePicker(
                onFilesPicked: (d) {},
              ),
            ),
            const SizedBox(height: 20),
            AngledTagInput(
              available: DocDings.tagList,
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
        const Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: AngledCornerButton(
              icon: Icon(FeatherIcons.upload),
              child: Text("Submit"),
            ),
          ),
        ),
      ],
    );
  }
}
