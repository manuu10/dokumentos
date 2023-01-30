import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';

class _QuillControllerHookCreator {
  const _QuillControllerHookCreator();

  /// Creates a [QuillController] that will be disposed automatically.
  ///
  /// The [text] parameter can be used to set the initial value of the
  /// controller.
  QuillController call({String? text, List<Object?>? keys}) {
    return use(_QuillControllerHook(text, keys));
  }

  /// Creates a [QuillController] from the initial [value] that will
  /// be disposed automatically.
  QuillController fromValue(
    TextEditingValue value, [
    List<Object?>? keys,
  ]) {
    return use(_QuillControllerHook.fromValue(value, keys));
  }
}

const useQuillController = _QuillControllerHookCreator();

class _QuillControllerHook extends Hook<QuillController> {
  const _QuillControllerHook(
    this.initialText, [
    List<Object?>? keys,
  ])  : initialValue = null,
        super(keys: keys);

  const _QuillControllerHook.fromValue(
    TextEditingValue this.initialValue, [
    List<Object?>? keys,
  ])  : initialText = null,
        super(keys: keys);

  final String? initialText;
  final TextEditingValue? initialValue;

  @override
  _QuillControllerHookState createState() {
    return _QuillControllerHookState();
  }
}

class _QuillControllerHookState
    extends HookState<QuillController, _QuillControllerHook> {
  late final _controller = QuillController.basic();

  @override
  QuillController build(BuildContext context) => _controller;

  @override
  void dispose() => _controller.dispose();

  @override
  String get debugLabel => 'useQuillController';
}
