import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitsgap/src/app.dart';
import 'package:bitsgap/src/auth/auth_store.dart';
import 'package:bitsgap/src/services/storage.dart';
import 'package:bitsgap/src/theme/theme_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => AuthStore()..init()),
        Provider<ThemeStore>(create: (_) => ThemeStore()..restoreTheme()),
      ],
      child: const App(),
    ),
  );
}
