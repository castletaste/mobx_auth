import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitsgap/src/auth/auth_store.dart';
import 'package:bitsgap/src/pages/auth/widgets/paints/bg_paint.dart';
import 'package:bitsgap/src/pages/auth/widgets/paints/logo_paint.dart';
import 'package:bitsgap/src/pages/auth/widgets/text_button.dart';
import 'package:bitsgap/src/theme/theme_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// view [size] of the screen/window
    final screen = MediaQuery.sizeOf(context);

    ///current [theme] of the app
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Stack(
        children: [
          //background paint
          Align(
            alignment: Alignment.topCenter,
            child: CustomPaint(
              size: Size(screen.width, screen.height * 0.30),
              isComplex: true,
              painter: BackgroundCustomPainter(
                fillColor: theme.colorScheme.secondary,
              ),
            ),
          ),
          //logo paint
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 24, top: 54),
            child: GestureDetector(
              onTap: () => context.read<ThemeStore>().changeCurrentTheme(),
              child: CustomPaint(
                size: const Size(48, 48),
                isComplex: true,
                painter: LogoCustomPainter(),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BGTextButton(
                  text: 'Change theme',
                  onTap: () => context.read<ThemeStore>().changeCurrentTheme()),
              BGTextButton(
                text: 'Loggout',
                onTap: () => context.read<AuthStore>().loggout(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
