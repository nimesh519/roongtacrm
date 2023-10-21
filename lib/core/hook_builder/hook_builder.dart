import 'package:flutter/material.dart';
import 'package:crm/core/hook_builder/hook.dart';

typedef AsyncHookBuilder<T> = Widget Function(BuildContext context, T? data);

class HookBuilder<T> extends StatefulWidget {
  final Hook<T> hook;
  final AsyncHookBuilder<T> builder;

  const HookBuilder({Key? key, 
    required this.hook,
    required this.builder,
  }) : super(key: key);

  @override
  State<HookBuilder<T>> createState() => _HookBuilderState<T>();
}

class _HookBuilderState<T> extends State<HookBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.hook.controller.stream,
      initialData: widget.hook.initialValue,
      builder: (context, snapshot) {
        return widget.builder(
          context,
          snapshot.data,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.hook.controller.close();
  }
}
