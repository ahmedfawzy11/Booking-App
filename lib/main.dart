import 'package:booking_app/booking_app.dart';
import 'package:booking_app/modules/login/login_screen.dart';
import 'package:booking_app/providers/theme_provider.dart';
import 'package:booking_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(_setAllProviders()));
}

Widget _setAllProviders() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(
          state: AppTheme.getThemeData,
        ),
      ),
    ],
    child: BookingApp(),
  );
}