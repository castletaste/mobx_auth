import 'package:flutter/material.dart';

class BGTextButton extends StatelessWidget {
  const BGTextButton({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 42),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        alignment: Alignment.center,
        child: Text(
          text,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.brightness == Brightness.light
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.tertiary,
          ),
        ),
      ),
    );
  }
}
