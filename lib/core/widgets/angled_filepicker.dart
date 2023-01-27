import 'dart:io';

import 'package:dokumentos/core/buttons/angled_corner_button.dart';
import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef FilePickedType = void Function(List<File> files);
typedef FilesPickedBuilderType = Widget Function(
    BuildContext context, List<File> files);

class AngledFilePicker extends HookWidget {
  const AngledFilePicker({
    super.key,
    required this.onFilesPicked,
    this.pickedFilesBuilder,
    this.color,
    this.showPickedFiles = true,
  });

  final FilePickedType onFilesPicked;
  final FilesPickedBuilderType? pickedFilesBuilder;
  final Color? color;
  final bool showPickedFiles;
  @override
  Widget build(BuildContext context) {
    final files = useState(<File>[]);
    final btn = AngledCornerButton(
      primaryColor: color,
      icon: const Icon(FeatherIcons.fileText),
      child: const Text("Pick Files"),
      onTap: () async {
        FilePickerResult? result =
            await FilePicker.platform.pickFiles(allowMultiple: true);

        if (result != null) {
          List<File> f = result.paths.map((path) => File(path!)).toList();
          onFilesPicked(f);
          files.value = f;
        }
      },
    );
    if (!showPickedFiles) {
      return btn;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        btn,
        const SizedBox(height: 20),
        pickedFilesBuilder != null
            ? pickedFilesBuilder!(context, files.value)
            : _defaultFilesViewer(context, files.value),
      ],
    );
  }

  Widget _defaultFilesViewer(BuildContext context, List<File> files) {
    return AngledContainer(
        backgroundColor: Colors.grey.shade900,
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Files:"),
                const Divider(),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var file in files)
                      AngledContainer(
                        backgroundColor: Colors.black,
                        borderInset: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Text(file.path),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
