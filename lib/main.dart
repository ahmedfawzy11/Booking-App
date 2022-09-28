import 'package:booking_app/Core/DI/injection.dart';
import 'package:booking_app/features/inviteScreen/presentation/page/invitePage.dart';
import 'package:booking_app/features/settingScreen/presentation/page/settingPage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Booking App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SettingScreen(),
    );
  }
}
