import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:dokumentos/core/widgets/angled_filepicker.dart';
import 'package:dokumentos/core/widgets/angled_tag_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart' as q;

class ImportNewDocumentScreen extends StatefulHookWidget {
  const ImportNewDocumentScreen({super.key});

  @override
  State<ImportNewDocumentScreen> createState() =>
      _ImportNewDocumentScreenState();
}

class _ImportNewDocumentScreenState extends State<ImportNewDocumentScreen> {
  q.QuillController _controller = q.QuillController.basic();
  @override
  Widget build(BuildContext context) {
    final selectedTags = useState(<DocumentTag>[]);
    return ListView(
      children: [
        Text(
          "Import Document",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(thickness: 3),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: AngledContainer(
            backgroundColor: Colors.grey.shade900,
            borderColor: Colors.grey,
            borderBottom: true,
            borderWidth: 3,
            child: const TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  border: InputBorder.none,
                  hintText: "Document Title"),
            ),
          ),
        ),
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
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: AngledContainer(
            backgroundColor: Colors.grey.shade900,
            borderColor: Colors.grey,
            borderWidth: 2,
            borderLeft: true,
            borderRight: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: q.QuillEditor.basic(
                controller: _controller,
                readOnly: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
