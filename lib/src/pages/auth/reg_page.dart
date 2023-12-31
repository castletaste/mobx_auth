import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitsgap/src/pages/auth/form_store.dart';
import 'package:bitsgap/src/theme/theme_store.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
    required this.maxWidth,
  });

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: TextField(
              onChanged: context.read<FormStore>().setEmail,
              decoration: const InputDecoration(hintText: 'Email'),
              scrollPadding: const EdgeInsets.all(160),
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ),
        szbx12,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: TextField(
              onChanged: context.read<FormStore>().setName,
              decoration: const InputDecoration(hintText: 'Username'),
              scrollPadding: const EdgeInsets.all(160),
              keyboardType: TextInputType.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ),
        szbx12,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: TextField(
              onChanged: context.read<FormStore>().setPassword,
              decoration: const InputDecoration(hintText: 'Password'),
              scrollPadding: const EdgeInsets.all(160),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ),
      ],
    );
  }
}
