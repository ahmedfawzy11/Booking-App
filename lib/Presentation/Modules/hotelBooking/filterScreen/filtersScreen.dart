import 'package:booking_app/Application/Utils/themes.dart';
import 'package:booking_app/Application/Widgets/commonAppBarView.dart';
import 'package:booking_app/Application/Widgets/commonButton.dart';
import 'package:booking_app/Data/Language/appLocalizations.dart';
import 'package:booking_app/Data/Models/popularFilterList.dart';
import 'package:booking_app/Presentation/Modules/hotelBooking/filterScreen/rangeSliderView.dart';
import 'package:booking_app/Presentation/Modules/hotelBooking/filterScreen/sliderView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;
  List<PopularFilterListData> accomodationListData =
      PopularFilterListData.accomodationList;

  RangeValues _values = RangeValues(
    100,
    600,
  );
  double distValue = 50.0;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: AppTheme.scaffoldBackgroundColor,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppBarView(
              iconData: Icons.close,
              onBackClick: () {
                Navigator.pop(
                  context,
                );
              },
              titleText: AppLocalizations(
                context,
              ).of("filter"),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: <Widget>[
                      priceBarFilter(),
                      Divider(
                        height: 1,
                      ),
                      popularFilter(),
                      Divider(
                        height: 1,
                      ),
                      distanceViewUI(),
                      Divider(
                        height: 1,
                      ),
                      allAccommodationUI()
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16 +
                      MediaQuery.of(
                        context,
                      ).padding.bottom,
                  top: 8),
              child: CommonButton(
                buttonText: AppLocalizations(
                  context,
                ).of(
                  "Apply_text",
                ),
                onTap: () {
                  Navigator.pop(
                    context,
                    true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget allAccommodationUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: Text(
            AppLocalizations(
              context,
            ).of(
              "type of accommodation",
            ),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(
                        context,
                      ).size.width >
                      360
                  ? 18
                  : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Column(
            children: getAccomodationListUI(),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getAccomodationListUI() {
    List<Widget> noList = [];
    for (var i = 0; i < accomodationListData.length; i++) {
      final date = accomodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(
              Radius.circular(
                4.0,
              ),
            ),
            onTap: () {
              setState(() {
                checkAppPosition(
                  i,
                );
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      AppLocalizations(context).of(
                        date.titleTxt,
                      ),
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: date.isSelected
                        ? Theme.of(
                            context,
                          ).primaryColor
                        : Colors.grey.withOpacity(
                            0.6,
                          ),
                    onChanged: (
                      value,
                    ) {
                      setState(
                        () {
                          checkAppPosition(
                            i,
                          );
                        },
                      );
                    },
                    value: date.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(
          Divider(
            height: 1,
          ),
        );
      }
    }
    return noList;
  }

  void checkAppPosition(
    int index,
  ) {
    if (index == 0) {
      if (accomodationListData[0].isSelected) {
        accomodationListData.forEach(
          (d) {
            d.isSelected = false;
          },
        );
      } else {
        accomodationListData.forEach(
          (d) {
            d.isSelected = true;
          },
        );
      }
    } else {
      accomodationListData[index].isSelected =
          !accomodationListData[index].isSelected;

      var count = 0;
      for (var i = 0; i < accomodationListData.length; i++) {
        if (i != 0) {
          var data = accomodationListData[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }

      if (count == accomodationListData.length - 1) {
        accomodationListData[0].isSelected = true;
      } else {
        accomodationListData[0].isSelected = false;
      }
    }
  }

  Widget distanceViewUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: Text(
            AppLocalizations(
              context,
            ).of(
              "distance from city",
            ),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(
                        context,
                      ).size.width >
                      360
                  ? 18
                  : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SliderView(
          distValue: distValue,
          onChangedListValue: (
            value,
          ) {
            distValue = value;
          },
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget popularFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: Text(
            AppLocalizations(
              context,
            ).of(
              "popular filter",
            ),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(
                        context,
                      ).size.width >
                      360
                  ? 18
                  : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Column(
            children: getPList(),
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getPList() {
    List<Widget> noList = [];
    var cout = 0;
    final columCount = 2;
    for (var i = 0; i < popularFilterListData.length / columCount; i++) {
      List<Widget> listUI = [];
      for (var i = 0; i < columCount; i++) {
        try {
          final date = popularFilterListData[cout];
          listUI.add(
            Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          4.0,
                        ),
                      ),
                      onTap: () {
                        setState(
                          () {
                            date.isSelected = !date.isSelected;
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 8,
                          bottom: 8,
                          right: 0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              date.isSelected
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: date.isSelected
                                  ? Theme.of(
                                      context,
                                    ).primaryColor
                                  : Colors.grey.withOpacity(
                                      0.6,
                                    ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                AppLocalizations(
                                  context,
                                ).of(
                                  date.titleTxt,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          cout += 1;
        } catch (e) {}
      }
      noList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: listUI,
        ),
      );
    }
    return noList;
  }

  Widget priceBarFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Text(
            AppLocalizations(
              context,
            ).of(
              "price_text",
            ),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(
                        context,
                      ).size.width >
                      360
                  ? 18
                  : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        RangeSliderView(
          values: _values,
          onChangeRangeValues: (values) {
            _values = values;
          },
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
