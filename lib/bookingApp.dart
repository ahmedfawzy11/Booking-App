// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:booking_app/Application/Providers/themeProvider.dart';
import 'package:booking_app/Application/Utils/enum.dart';
import 'package:booking_app/Data/Language/appLocalizations.dart';
import 'package:booking_app/Domain/common/common.dart';
import 'package:booking_app/Presentation/Modules/splash/introductionScreen.dart';
import 'package:booking_app/Presentation/Modules/splash/splashScreen.dart';
import 'package:booking_app/Presentation/Routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

BuildContext? applicationcontext;

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  _BookingAppState createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer<ThemeProvider>(
      builder: (
        _,
        provider,
        child,
      ) {
        applicationcontext = context;

        final ThemeData _theme = provider.themeData;
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale(
              'en',
            ), // English
            Locale(
              'fr',
            ), //French
            Locale(
              'ja',
            ), // Japaneses
            Locale(
              'ar',
            ), //Arabic
          ],
          navigatorKey: navigatorKey,
          title: 'Motel',
          debugShowCheckedModeBanner: false,
          theme: _theme,
          routes: _buildRoutes(),
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            _setFirstTimeSomeData(
              context,
              _theme,
            );
            return Directionality(
              textDirection:
                  context.read<ThemeProvider>().languageType == LanguageType.ar
                      ? TextDirection.rtl
                      : TextDirection.ltr,
              child: Builder(
                builder: (
                  BuildContext context,
                ) {
                  return MediaQuery(
                    data: MediaQuery.of(
                      context,
                    ).copyWith(
                      textScaleFactor: MediaQuery.of(
                                context,
                              ).size.width >
                              360
                          ? 1.0
                          : MediaQuery.of(context).size.width >= 340
                              ? 0.9
                              : 0.8,
                    ),
                    child: child ?? const SizedBox(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

// When This Application Open Every Time on That Time We Check and Update Some Theme Data

  void _setFirstTimeSomeData(
    BuildContext context,
    ThemeData theme,
  ) {
    applicationcontext = context;
    _setStatusBarNavigationBarTheme(
      theme,
    );

    // We Call Some Theme Basic Data Set in App Like Color, Font , Theme Mode , Language

    context.read<ThemeProvider>().checkAndSetThemeMode(
          MediaQuery.of(context).platformBrightness,
        );
    context.read<ThemeProvider>().checkAndSetColorType();
    context.read<ThemeProvider>().checkAndSetFonType();
    context.read<ThemeProvider>().checkAndSetLanguage();
  }

  void _setStatusBarNavigationBarTheme(
    ThemeData themeData,
  ) {
    final brightness = !kIsWeb && Platform.isAndroid
        ? themeData.brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light
        : themeData.brightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      statusBarBrightness: brightness,
      systemNavigationBarColor: themeData.scaffoldBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness,
    ));
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      RoutesName.Splash: (BuildContext context) => SplashScreen(),
      RoutesName.IntroductionScreen: (
        BuildContext context,
      ) =>
          const IntroductionScreen(),
    };
  }
}
