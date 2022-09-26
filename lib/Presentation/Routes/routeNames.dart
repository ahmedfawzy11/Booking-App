// ignore_for_file: file_names

import 'package:booking_app/Modules/bottomTab/bottomTabScreen.dart';
import 'package:booking_app/Modules/hotelBooking/filterScreen/filtersScreen.dart';
import 'package:booking_app/Modules/hotelBooking/hotelHomeScreen.dart';
import 'package:booking_app/Modules/hotelDetails/roomBookingScreen.dart';
import 'package:booking_app/Modules/hotelDetails/searchScreen.dart';
import 'package:booking_app/Modules/login/forgotPassword.dart';
import 'package:booking_app/Modules/login/loginScreen.dart';
import 'package:booking_app/Modules/login/signUpScreen.dart';
import 'package:booking_app/routes/routes.dart';
import 'package:flutter/material.dart';

class NavigationServices {
  NavigationServices(
    this.context,
  );

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(
    Widget widget, {
    bool fullscreenDialog = false,
  }) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (
          context,
        ) =>
            widget,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  void gotoSplashScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.Splash,
      (
        Route<dynamic> route,
      ) =>
          false,
    );
  }

  void gotoIntroductionScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.IntroductionScreen,
      (
        Route<dynamic> route,
      ) =>
          false,
    );
  }

  Future<dynamic> gotoLoginScreen() async {
    return await _pushMaterialPageRoute(
      LoginScreen(),
    );
  }

  Future<dynamic> gotoTabScreen() async {
    return await _pushMaterialPageRoute(
      BottomTabScreen(),
    );
  }

  Future<dynamic> gotoSignScreen() async {
    return await _pushMaterialPageRoute(
      SignUpScreen(),
    );
  }

  Future<dynamic> gotoForgotPassword() async {
    return await _pushMaterialPageRoute(
      ForgotPasswordScreen(),
    );
  }

  Future<dynamic> gotoSearchScreen() async {
    return await _pushMaterialPageRoute(
      SearchScreen(),
    );
  }

  Future<dynamic> gotoHotelHomeScreen() async {
    return await _pushMaterialPageRoute(
      HotelHomeScreen(),
    );
  }

  Future<dynamic> gotoFiltersScreen() async {
    return await _pushMaterialPageRoute(
      FiltersScreen(),
    );
  }

  Future<dynamic> gotoRoomBookingScreen(
    String hotelname,
  ) async {
    return await _pushMaterialPageRoute(
      RoomBookingScreen(
        hotelName: hotelname,
      ),
    );
  }
}
