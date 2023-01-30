import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AngledCornerButton extends HookWidget {
  const AngledCornerButton(
      {this.onTap,
      this.borderColor,
      this.borderHoverColor,
      this.backgroundColor,
      this.backgroundHoverColor,
      this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      this.icon,
      this.borderWidth = 2,
      this.cornerInset = 7,
      this.connectBottom = false,
      this.connectTop = false,
      required this.child,
      Key? key,
      this.disableBackground = false,
      this.primaryColor})
      : assert(child != null || icon != null,
            "Provide atleast a child or and icon to display"),
        super(key: key);
  final Widget? child;
  final Widget? icon;

  final VoidCallback? onTap;

  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? backgroundHoverColor;
  final Color? borderHoverColor;
  final Color? borderColor;

  final double borderWidth;
  final double cornerInset;

  final bool connectTop;
  final bool connectBottom;

  final EdgeInsets padding;

  final bool disableBackground;

  @override
  Widget build(BuildContext context) {
    final hovered = useState(false);
    final mainColor = primaryColor ?? Theme.of(context).primaryColor;

    final newBorderHoverColor = borderHoverColor ?? mainColor;
    final newBackgroundColor = disableBackground
        ? null
        : backgroundColor ?? mainColor.withOpacity(0.4);
    final newBackgroundHoverColor =
        backgroundHoverColor ?? mainColor.withOpacity(0.5);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => hovered.value = true,
      onExit: (e) => hovered.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: AngledContainer(
          borderColor: hovered.value ? newBorderHoverColor : borderColor,
          borderWidth: borderWidth,
          borderInset: cornerInset,
          backgroundColor:
              hovered.value ? newBackgroundHoverColor : newBackgroundColor,
          borderTop: connectTop,
          borderBottom: connectBottom,
          borderLeft: true,
          borderRight: true,
          child: Padding(
            padding: padding,
            child: Builder(
              builder: (context) {
                if (icon != null && child != null) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [icon!, const SizedBox(width: 10), child!],
                  );
                }
                if (icon == null) {
                  return child!;
                }
                return icon!;
              },
            ),
          ),
        ),
      ),
    );
  }
}
