import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'package:bitsgap/src/auth/auth_store.dart';
import 'package:bitsgap/src/pages/auth/auth_screen.dart';
import 'package:bitsgap/src/pages/home/home_screen.dart';
import 'package:bitsgap/src/theme/theme_store.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: Observer(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bitsgap',
            theme: context.watch<ThemeStore>().currentThemeData,
            home: context.watch<AuthStore>().isLoggedIn
                ? const HomePage()
                : const AuthPage(title: 'Bitsgap'),
          );
        },
      ),
    );
  }
}
