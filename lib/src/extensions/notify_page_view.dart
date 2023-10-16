import 'package:flutter/material.dart';

class NotifyingPageView extends StatefulWidget {
  final ValueNotifier<double> notifier;

  final List<Widget> pages;
  final PageController controller;

  const NotifyingPageView(
      {Key? key,
      required this.notifier,
      required this.pages,
      required this.controller})
      : super(key: key);

  @override
  NotifyingPageViewState createState() => NotifyingPageViewState();
}

class NotifyingPageViewState extends State<NotifyingPageView> {

  void _onScroll() {
    widget.notifier.value = widget.controller.page ?? 0;
  }

  @override
  void didChangeDependencies() {
    widget.controller.addListener(_onScroll);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      children: widget.pages,
    );
  }
}
