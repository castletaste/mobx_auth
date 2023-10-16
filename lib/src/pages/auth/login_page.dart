import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitsgap/src/pages/auth/form_store.dart';
import 'package:bitsgap/src/theme/theme_store.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.maxWidth,
  });

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: TextField(
                onChanged: context.read<FormStore>().setName,
                decoration: const InputDecoration(hintText: 'Username'),
                scrollPadding: const EdgeInsets.all(160),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.tertiary))),
        szbx12,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: TextField(
              onChanged: context.read<FormStore>().setPassword,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              scrollPadding: const EdgeInsets.all(160),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ),
      ],
    );
  }
}
