import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class AngledQuillEditor extends StatelessWidget {
  const AngledQuillEditor({Key? key, required this.controller})
      : super(key: key);

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return AngledContainer(
      backgroundColor: Colors.grey.shade900,
      borderColor: Colors.grey,
      borderWidth: 2,
      borderLeft: true,
      borderRight: true,
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            QuillToolbar.basic(
              controller: controller,
              showAlignmentButtons: false,
              showBackgroundColorButton: false,
              showCenterAlignment: false,
              showCodeBlock: false,
              showFontFamily: false,
              showFontSize: false,
              showSearchButton: false,
              showIndent: false,
              showInlineCode: false,
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.text,
                  child: Focus(
                    child: QuillEditor.basic(
                      controller: controller,
                      readOnly: false, // true for view only mode
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
