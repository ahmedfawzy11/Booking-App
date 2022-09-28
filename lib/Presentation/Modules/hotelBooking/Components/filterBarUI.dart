import 'package:booking_app/Application/Utils/textStyles.dart';
import 'package:booking_app/Application/Utils/themes.dart';
import 'package:booking_app/Data/Language/appLocalizations.dart';
import 'package:booking_app/Presentation/Routes/routeNames.dart';
import 'package:flutter/material.dart';

class FilterBarUI extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: AppTheme.scaffoldBackgroundColor,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 4,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    "530",
                    style: TextStyles(
                      context,
                    ).getRegularStyle(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 0.0,
                    ),
                    child: Text(
                      AppLocalizations(
                        context,
                      ).of(
                        "hotel_found",
                      ),
                      style: TextStyles(
                        context,
                      ).getRegularStyle(),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      NavigationServices(
                        context,
                      ).gotoFiltersScreen();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            AppLocalizations(
                              context,
                            ).of(
                              "filter",
                            ),
                            style: TextStyles(
                              context,
                            ).getRegularStyle(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: Icon(
                              Icons.sort,
                              color: Theme.of(
                                context,
                              ).primaryColor,
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
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Divider(
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
