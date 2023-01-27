import 'package:dokumentos/core/angled_widgets/angled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AngledCornerButton extends HookWidget {
  const AngledCornerButton({
    this.onTap,
    this.borderColor = Colors.transparent,
    this.borderHoverColor = Colors.red,
    this.borderWidth = 2,
    this.cornerInset = 7,
    this.connectBottom = false,
    this.connectTop = false,
    required this.child,
    Key? key,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  }) : super(key: key);
  final VoidCallback? onTap;
  final Color borderColor;
  final double borderWidth;
  final Widget child;
  final double cornerInset;
  final bool connectTop;
  final bool connectBottom;
  final Color? backgroundColor;
  final Color borderHoverColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final hovered = useState(false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => hovered.value = true,
      onExit: (e) => hovered.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: AngledContainer(
          borderColor: hovered.value ? borderHoverColor : borderColor,
          borderWidth: borderWidth,
          borderInset: cornerInset,
          backgroundColor: backgroundColor,
          borderTop: connectTop,
          borderBottom: connectBottom,
          borderLeft: true,
          borderRight: true,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
