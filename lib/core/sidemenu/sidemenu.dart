import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.all(8),
    this.gradient,
    this.color,
    this.footer,
  });
  final List<Widget> children;
  final Widget? footer;

  final Gradient? gradient;
  final Color? color;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return AngledContainer(
      borderRight: true,
      borderColor: Colors.grey,
      angleBottomLeft: false,
      angleTopLeft: false,
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color.fromARGB(255, 30, 30, 30), Color.fromARGB(255, 6, 3, 3)],
      ),
      child: SizedBox(
        height: double.infinity,
        width: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: padding,
                children: children,
              ),
            ),
            if (footer != null)
              Padding(
                padding: padding,
                child: footer!,
              )
          ],
        ),
      ),
    );
  }
}
