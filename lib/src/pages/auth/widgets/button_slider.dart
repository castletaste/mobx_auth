import 'package:flutter/material.dart';

class ButtonSlider extends StatelessWidget {
  const ButtonSlider({
    Key? key,
    required this.maxWidth,
    required this.notifier,
    required this.onLogin,
    required this.onRegister,
    required this.controller,
  }) : super(key: key);

  final double maxWidth;
  final ValueNotifier<double> notifier;
  final PageController controller;

  final VoidCallback onLogin;
  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).colorScheme.secondary,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      switch (notifier.value.toInt()) {
                        case 0:
                          onLogin();
                        default:
                          controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(1 - (notifier.value)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).brightness ==
                                          Brightness.light &&
                                      notifier.value.round() == 1
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
                      switch (notifier.value.toInt()) {
                        case 1:
                          onRegister();
                        default:
                          controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(notifier.value),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).brightness ==
                                        Brightness.light &&
                                    notifier.value.round() == 0
                                ? Theme.of(context).colorScheme.tertiary
                                : null),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
