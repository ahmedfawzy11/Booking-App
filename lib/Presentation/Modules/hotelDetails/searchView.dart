import 'package:booking_app/Application/Utils/helper.dart';
import 'package:booking_app/Application/Utils/textStyles.dart';
import 'package:booking_app/Application/Utils/themes.dart';
import 'package:booking_app/Application/Widgets/commonCard.dart';
import 'package:booking_app/Application/Widgets/listCellAnimationView.dart';
import 'package:booking_app/Data/Models/hotelListData.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final HotelListData hotelInfo;
  final AnimationController animationController;
  final Animation<double> animation;

  const SearchView({
    Key? key,
    required this.hotelInfo,
    required this.animationController,
    required this.animation,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: AspectRatio(
          aspectRatio: 0.75,
          child: CommonCard(
            color: AppTheme.backgroundColor,
            radius: 16,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.asset(
                      hotelInfo.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            hotelInfo.titleTxt,
                            style: TextStyles(
                              context,
                            ).getBoldStyle(),
                          ),
                          Text(
                            Helper.getRoomText(hotelInfo.roomData!),
                            style: TextStyles(
                              context,
                            ).getRegularStyle().copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                  color: Theme.of(
                                    context,
                                  ).disabledColor.withOpacity(
                                        0.6,
                                      ),
                                ),
                          ),
                          Text(
                            Helper.getLastSearchDate(
                              hotelInfo.date!,
                            ),
                            style: TextStyles(
                              context,
                            ).getRegularStyle().copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                  color: Theme.of(
                                    context,
                                  ).disabledColor.withOpacity(
                                        0.6,
                                      ),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
