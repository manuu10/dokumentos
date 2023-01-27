import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Home",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(thickness: 3),
      ],
    );
  }
}
