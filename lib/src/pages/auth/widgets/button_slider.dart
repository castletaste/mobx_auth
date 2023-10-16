import 'package:flutter/material.dart';

class ButtonSlider extends StatefulWidget {
  const ButtonSlider({
    Key? key,
    required this.maxWidth,
    required this.controller,
    required this.onLogin,
    required this.onRegister,
  }) : super(key: key);

  final double maxWidth;
  final PageController controller;

  final VoidCallback onLogin;
  final VoidCallback onRegister;

  @override
  State<ButtonSlider> createState() => _ButtonSliderState();
}

class _ButtonSliderState extends State<ButtonSlider>
    with AutomaticKeepAliveClientMixin {
  @override
  void didChangeDependencies() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.secondary,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                });
                switch (widget.controller.page?.toInt()) {
                  case 0:
                    widget.onLogin();
                    break;
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withOpacity(1 - (widget.controller.page ?? 0)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            Theme.of(context).brightness == Brightness.light &&
                                    widget.controller.page?.round() == 1
                                ? Theme.of(context).colorScheme.tertiary
                                : null,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  switch (widget.controller.page?.toInt()) {
                    case 1:
                      widget.onRegister();
                      break;
                  }
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withOpacity(widget.controller.page ?? 0),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Sign up',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).brightness == Brightness.light &&
                              widget.controller.page?.round() == 0
                          ? Theme.of(context).colorScheme.tertiary
                          : null),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
