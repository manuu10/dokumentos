// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DocumentTag {
  final Color color;
  final String title;
  DocumentTag({
    required this.color,
    required this.title,
  });
}

class AngledTagInput extends HookWidget {
  const AngledTagInput({
    required this.available,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final List<DocumentTag> available;
  final List<DocumentTag> selected;
  final void Function(DocumentTag tag) onTap;

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;
    const unselectedColor = Colors.grey;

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: available.map((tag) {
        final isSelected = selected.any((e) => e.title == tag.title);
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => onTap(tag),
            child: AngledContainer(
              borderWidth: 2,
              borderBottom: true,
              backgroundColor: (isSelected ? selectedColor : unselectedColor)
                  .withOpacity(0.3),
              borderColor: isSelected ? selectedColor : unselectedColor,
              borderInset: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FeatherIcons.tag,
                        size: 16,
                        color: tag.color,
                      ),
                      const SizedBox(width: 10),
                      Text(tag.title),
                      if (isSelected) const SizedBox(width: 10),
                      if (isSelected)
                        Icon(FeatherIcons.check, size: 16, color: selectedColor)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
