import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Sharing functionality and reducing boilerplate
class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  BaseWidget({
    Key key,
    this.builder,
    this.model,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: widget.builder,
      child: widget.child,
    );
  }
}

//? Credit: https://github.com/FilledStacks/flutter-tutorials/blob/master/014-provider-v3-updates/2-final/lib/ui/views/base_widget.dart