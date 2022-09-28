import 'package:booking_app/Application/Providers/themeProvider.dart';
import 'package:booking_app/Application/Utils/localfiles.dart';
import 'package:booking_app/Application/Utils/textStyles.dart';
import 'package:booking_app/Application/Utils/themes.dart';
import 'package:booking_app/Application/Widgets/commonButton.dart';
import 'package:booking_app/Data/Language/appLocalizations.dart';
import 'package:booking_app/Presentation/Routes/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoadText = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _loadAppLocalizations(),
    );

    //  Call After First Frame Receiver So We Have Context

    super.initState();
  }

  Future<void> _loadAppLocalizations() async {
    try {
      setState(() {
        isLoadText = true;
      });
    } catch (_) {}
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final appTheme = Provider.of<ThemeProvider>(
      context,
    );
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              foregroundDecoration: !appTheme.isLightMode
                  ? BoxDecoration(
                      color: Theme.of(
                        context,
                      ).backgroundColor.withOpacity(
                            0.4,
                          ),
                    )
                  : null,
              width: MediaQuery.of(
                context,
              ).size.width,
              height: MediaQuery.of(
                context,
              ).size.height,
              child: Image.asset(
                LocalFiles.introduction,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).dividerColor,
                          offset: const Offset(
                            1.1,
                            1.1,
                          ),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                      child: Image.asset(
                        LocalFiles.appIcon,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Motel",
                  textAlign: TextAlign.left,
                  style: TextStyles(
                    context,
                  ).getBoldStyle().copyWith(
                        fontSize: 24,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AnimatedOpacity(
                  opacity: isLoadText ? 1.0 : 0.0,
                  duration: const Duration(
                    milliseconds: 420,
                  ),
                  child: Text(
                    AppLocalizations(
                      context,
                    ).of(
                      "best_hotel_deals",
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyles(
                      context,
                    ).getRegularStyle().copyWith(),
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: SizedBox(),
                ),
                AnimatedOpacity(
                  opacity: isLoadText ? 1.0 : 0.0,
                  duration: const Duration(
                    milliseconds: 680,
                  ),
                  child: CommonButton(
                    padding: const EdgeInsets.only(
                      left: 48,
                      right: 48,
                      bottom: 8,
                      top: 8,
                    ),
                    buttonText: AppLocalizations(
                      context,
                    ).of(
                      "get_started",
                    ),
                    onTap: () {
                      NavigationServices(
                        context,
                      ).gotoIntroductionScreen();
                    },
                  ),
                ),
                AnimatedOpacity(
                  opacity: isLoadText ? 1.0 : 0.0,
                  duration: const Duration(
                    milliseconds: 1200,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 24.0 +
                            MediaQuery.of(
                              context,
                            ).padding.bottom,
                        top: 16),
                    child: Text(
                      AppLocalizations(
                        context,
                      ).of(
                        "already_have_account",
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyles(
                        context,
                      ).getDescriptionStyle().copyWith(
                            color: AppTheme.whiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
