import 'package:flutter/material.dart';

class CustomAnimatedWidget extends StatefulWidget {
  final Duration animationDuration;

  final Icon widget;

  const CustomAnimatedWidget({
    Key? key,
    this.animationDuration = const Duration(milliseconds: 1000),
    required this.widget,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomAnimatedWidgetState();
}

class _CustomAnimatedWidgetState extends State<CustomAnimatedWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: widget.animationDuration, vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.65, end: 1.1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
      child: widget.widget,
    );
  }
}
