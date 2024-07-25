import 'package:amora_mobile_app/models/user_details_model.dart';
import 'package:amora_mobile_app/ui/pages/swipe/user_profile.dart';
import 'package:amora_mobile_app/ui/widgets/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipePage extends StatelessWidget {
  const SwipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CardSwiper(
          numberOfCardsDisplayed: 1,
          allowedSwipeDirection:
              const AllowedSwipeDirection.symmetric(horizontal: true),
          cardsCount: usersInfo.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              UserProfile(userDetail: usersInfo[index])),
    );
  }
}
