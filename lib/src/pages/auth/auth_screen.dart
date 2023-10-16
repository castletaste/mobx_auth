import 'package:bitsgap/src/pages/auth/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitsgap/src/auth/auth_store.dart';
import 'package:bitsgap/src/pages/auth/form_store.dart';
import 'package:bitsgap/src/pages/auth/login_page.dart';
import 'package:bitsgap/src/pages/auth/reg_page.dart';
import 'package:bitsgap/src/pages/auth/widgets/button_slider.dart';
import 'package:bitsgap/src/pages/auth/widgets/paints/bg_paint.dart';
import 'package:bitsgap/src/pages/auth/widgets/paints/logo_paint.dart';
import 'package:bitsgap/src/pages/auth/widgets/text_button.dart';
import 'package:bitsgap/src/theme/theme_store.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    /// view [size] of the screen/window
    final screen = MediaQuery.sizeOf(context);

    ///current [theme] of the app
    final theme = Theme.of(context);

    ///max width of the content
    const maxWidth = 420.0;

    final c = PageController(initialPage: 0);

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
          //content
          Provider(
            create: (_) => FormStore(),
            child: AuthForm(screen: screen, c: c, maxWidth: maxWidth),
          )
        ],
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.screen,
    required this.c,
    required this.maxWidth,
  });

  final Size screen;
  final PageController c;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screen.height * 0.41),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 168),
            child: PageView(
              controller: c,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: LoginPage(maxWidth: maxWidth)),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RegisterPage(maxWidth: maxWidth)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ButtonSlider(
              maxWidth: maxWidth,
              controller: c,
              onLogin: () {
                context.read<AuthStore>().login((
                  pass: context.read<FormStore>().password,
                  name: context.read<FormStore>().username,
                )).then((value) => Toast.success());
              },
              onRegister: () {
                context.read<AuthStore>().register((
                  mail: context.read<FormStore>().email,
                  pass: context.read<FormStore>().password,
                  name: context.read<FormStore>().username,
                )).then((value) => Toast.success());
              },
            ),
          ),
          const BGTextButton(text: 'Forgot password?'),
        ],
      ),
    );
  }
}