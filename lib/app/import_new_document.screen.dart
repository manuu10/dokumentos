import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:dokumentos/core/widgets/angled_filepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as q;

class ImportNewDocumentScreen extends StatefulWidget {
  const ImportNewDocumentScreen({super.key});

  @override
  State<ImportNewDocumentScreen> createState() =>
      _ImportNewDocumentScreenState();
}

class _ImportNewDocumentScreenState extends State<ImportNewDocumentScreen> {
  q.QuillController _controller = q.QuillController.basic();
  @override
  Widget build(BuildContext context) {
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
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var tag in [
              "Rechnung",
              "Lohnabrechnung",
              "Versicherung",
              "Verträge"
            ])
              AngledContainer(
                borderWidth: 2,
                borderBottom: true,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.3),
                borderColor: Theme.of(context).primaryColor,
                borderInset: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(tag),
                ),
              ),
          ],
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
