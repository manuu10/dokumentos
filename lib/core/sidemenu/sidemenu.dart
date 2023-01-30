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
    this.slim = false,
  });
  final List<Widget> children;
  final bool slim;
  final Widget? footer;
  final Gradient? gradient;
  final Color? color;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return AngledContainer(
      borderRight: true,
      borderColor: Colors.grey,
      borderWidth: 2,
      angleBottomLeft: false,
      angleTopLeft: false,
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color.fromARGB(255, 30, 30, 30), Color.fromARGB(255, 6, 3, 3)],
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
          height: double.infinity,
          width: slim ? 80 : 300,
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
      ),
    );
  }
}
