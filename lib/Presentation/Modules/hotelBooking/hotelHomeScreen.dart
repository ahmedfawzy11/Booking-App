import 'package:booking_app/Application/Providers/themeProvider.dart';
import 'package:booking_app/Application/Utils/enum.dart';
import 'package:booking_app/Application/Utils/textStyles.dart';
import 'package:booking_app/Application/Utils/themes.dart';
import 'package:booking_app/Application/Widgets/commonCard.dart';
import 'package:booking_app/Application/Widgets/commonSearchBar.dart';
import 'package:booking_app/Application/Widgets/removeForce.dart';
import 'package:booking_app/Data/Language/appLocalizations.dart';
import 'package:booking_app/Data/Models/hotelListData.dart';
import 'package:booking_app/Presentation/Modules/hotelBooking/Components/filterBarUI.dart';
import 'package:booking_app/Presentation/Modules/hotelBooking/Components/mapAndListView.dart';
import 'package:booking_app/Presentation/Modules/hotelBooking/Components/timeDateView.dart';
import 'package:booking_app/Presentation/Modules/myTrips/hotelListView.dart';
import 'package:booking_app/Presentation/Routes/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HotelHomeScreen extends StatefulWidget {
  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _animationController;
  var hotelList = HotelListData.hotelList;
  ScrollController scrollController = new ScrollController();
  int room = 1;
  int ad = 2;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(
    const Duration(
      days: 5,
    ),
  );
  bool _isShowMap = false;

  final searchBarHeight = 158.0;
  final filterBarHeight = 52.0;
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController = AnimationController(
      duration: const Duration(
        milliseconds: 0,
      ),
      vsync: this,
    );
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        _animationController.animateTo(0.0);
      } else if (scrollController.offset > 0.0 &&
          scrollController.offset < searchBarHeight) {
        _animationController.animateTo(
          (scrollController.offset / searchBarHeight),
        );
      } else {
        _animationController.animateTo(
          1.0,
        );
      }
    });
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RemoveForce(
            onClick: () {
              FocusScope.of(
                context,
              ).requestFocus(
                FocusNode(),
              );
            },
            child: Column(
              children: <Widget>[
                _getAppBarUI(),
                _isShowMap
                    ? MapAndListView(
                        hotelList: hotelList,
                        searchBarUI: _getSearchBarUI(),
                      )
                    : Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: AppTheme.scaffoldBackgroundColor,
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: hotelList.length,
                                padding: const EdgeInsets.only(
                                  top: 8 + 158 + 52.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (
                                  context,
                                  index,
                                ) {
                                  var count = hotelList.length > 10
                                      ? 10
                                      : hotelList.length;
                                  var animation = Tween(
                                    begin: 0.0,
                                    end: 1.0,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animationController,
                                      curve: Interval(
                                        (1 / count) * index,
                                        1.0,
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                    ),
                                  );
                                  animationController.forward();
                                  return HotelListView(
                                    callback: () {
                                      NavigationServices(
                                        context,
                                      ).gotoRoomBookingScreen(
                                          hotelList[index].titleTxt);
                                    },
                                    hotelData: hotelList[index],
                                    animation: animation,
                                    animationController: animationController,
                                  );
                                },
                              ),
                            ),
                            AnimatedBuilder(
                              animation: _animationController,
                              builder: (
                                BuildContext context,
                                Widget? child,
                              ) {
                                return Positioned(
                                  top: -searchBarHeight *
                                      (_animationController.value),
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        color: Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
                                        child: Column(
                                          children: <Widget>[
                                            _getSearchBarUI(),
                                            const TimeDateView(),
                                          ],
                                        ),
                                      ),
                                      FilterBarUI(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 8,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8,
                top: 8,
                bottom: 8,
                left: 8,
              ),
              child: CommonCard(
                color: AppTheme.backgroundColor,
                radius: 36,
                child: const CommonSearchBar(
                  enabled: true,
                  isShow: false,
                  text: "London...",
                ),
              ),
            ),
          ),
          CommonCard(
            color: AppTheme.primaryColor,
            radius: 36,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  NavigationServices(
                    context,
                  ).gotoSearchScreen();
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Icon(
                    FontAwesomeIcons.search,
                    size: 20,
                    color: AppTheme.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAppBarUI() {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 8,
        right: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment:
                context.read<ThemeProvider>().languageType == LanguageType.ar
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    32.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                AppLocalizations(
                  context,
                ).of(
                  "explore",
                ),
                style: TextStyles(
                  context,
                ).getTitleStyle(),
              ),
            ),
          ),
          Container(
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        32.0,
                      ),
                    ),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        32.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isShowMap = !_isShowMap;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: Icon(
                        _isShowMap ? Icons.sort : FontAwesomeIcons.mapMarkedAlt,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
