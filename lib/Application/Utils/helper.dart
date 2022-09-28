import 'package:booking_app/Application/Providers/themeProvider.dart';
import 'package:booking_app/Application/Utils/enum.dart';
import 'package:booking_app/Application/Utils/themes.dart';
import 'package:booking_app/Application/Widgets/customDialog.dart';
import 'package:booking_app/Data/Language/appLocalizations.dart';
import 'package:booking_app/Data/Models/roomData.dart';
import 'package:booking_app/bookingApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class Helper {
  static String getRoomText(RoomData roomData) {
    return "${roomData.numberRoom} ${AppLocalizations(applicationcontext!).of("room_data")} ${roomData.people} ${AppLocalizations(applicationcontext!).of("people_data")}";
  }

  static String getDateText(DateText dateText) {
    LanguageType languageType = applicationcontext == null
        ? LanguageType.en
        : applicationcontext!.read<ThemeProvider>().languageType;
    return "0${dateText.startDate} ${DateFormat('MMM', languageType.toString().split(".")[1]).format(DateTime.now())} - 0${dateText.endDate} ${DateFormat('MMM', languageType.toString().split(".")[1]).format(DateTime.now().add(const Duration(days: 2)))}";
  }

  static String getLastSearchDate(DateText dateText) {
    LanguageType languageType = applicationcontext == null
        ? LanguageType.en
        : applicationcontext!.read<ThemeProvider>().languageType;
    return "${dateText.startDate} - ${dateText.endDate} ${DateFormat('MMM', languageType.toString().split(".")[1]).format(DateTime.now().add(const Duration(days: 2)))}";
  }

  static String getPeopleandChildren(RoomData roomData) {
    return "${AppLocalizations(applicationcontext!).of("sleeps")} ${roomData.numberRoom} ${AppLocalizations(applicationcontext!).of("people_data")} + ${roomData.numberRoom} ${AppLocalizations(applicationcontext!).of("children")} ";
  }

  static Widget ratingStar({double rating = 4.5}) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: AppTheme.primaryColor,
      ),
      itemCount: 5,
      unratedColor: AppTheme.secondaryTextColor,
      itemSize: 18.0,
      direction: Axis.horizontal,
    );
  }

  Future<bool> showCommonPopup(
      String title, String descriptionText, BuildContext context,
      {bool isYesOrNoPopup = false, bool barrierDismissible = true}) async {
    bool isOkClick = false;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: descriptionText,
        onCloseClick: () {
          Navigator.of(context).pop();
        },
        actionButtonList: isYesOrNoPopup
            ? <Widget>[
                CustomDialogActionButton(
                  buttonText: "NO",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CustomDialogActionButton(
                  buttonText: "YES",
                  color: Colors.red,
                  onPressed: () {
                    isOkClick = true;
                    Navigator.of(context).pop();
                  },
                )
              ]
            : <Widget>[
                CustomDialogActionButton(
                  buttonText: "OK",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
      ),
    ).then((_) {
      return isOkClick;
    });
  }
}
