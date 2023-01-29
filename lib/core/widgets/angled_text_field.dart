import 'package:dokumentos/core/widgets/angled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AngledTextField extends StatefulWidget {
  const AngledTextField({Key? key}) : super(key: key);

  @override
  State<AngledTextField> createState() => _AngledTextFieldState();
}

class _AngledTextFieldState extends State<AngledTextField> {
  late FocusNode node;

  @override
  void initState() {
    node = FocusNode();
    node.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AngledContainer(
      backgroundColor: Colors.grey.shade900,
      borderColor: node.hasFocus ? Theme.of(context).primaryColor : Colors.grey,
      borderBottom: true,
      borderWidth: 3,
      child: TextField(
        focusNode: node,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          border: InputBorder.none,
          hintText: "Document Title",
        ),
      ),
    );
  }
}
