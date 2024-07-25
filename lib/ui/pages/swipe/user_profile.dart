import 'package:amora_mobile_app/models/user_details_model.dart';
import 'package:amora_mobile_app/utils/helpers/helper_widgets.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final UserDetail userDetail;

  const UserProfile({
    super.key,
    required this.userDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              CustomCard(
                imageUrl: userDetail.imageUrls[0],
              ),
              addVerticalMargin(),
              SelfIntroParagraph(
                title: "About",
                text: userDetail.about,
              ),
              addVerticalMargin(),
              const InterestChips(),
              addVerticalMargin(),
              CustomPhoto(
                imageUrl: userDetail.imageUrls[1],
              ),
              addVerticalMargin(),
              CustomPhoto(
                imageUrl: userDetail.imageUrls[2],
              ),
              addVerticalMargin(),
              CustomPhoto(
                imageUrl: userDetail.imageUrls[2],
              ),
            ],
          ),
        ),
        const ThreePickButtons(),
      ],
    );
  }
}

class ThreePickButtons extends StatelessWidget {
  const ThreePickButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.transparent,
              Colors.white10,
              Colors.white38,
              Colors.white54,
              Colors.white60,
              Colors.white70,
              Colors.white,
            ])),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PickButton(
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
                addHorizontalMargin(width: 15),
                PickButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                  isLikeButton: true,
                ),
                addHorizontalMargin(width: 15),
                PickButton(
                  icon: const Icon(
                    Icons.star,
                    color: Color(0xFFFFBE16),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PickButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLikeButton;
  final Icon icon;

  const PickButton({
    super.key,
    required this.onPressed,
    this.isLikeButton = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: isLikeButton ? 60 : 50.0,
        height: isLikeButton ? 60 : 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          iconSize: isLikeButton ? 32 : 25,
        ),
      ),
    );
  }
}

class SelfIntroParagraph extends StatelessWidget {
  final String title;
  final String text;

  const SelfIntroParagraph({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}

class InterestChips extends StatelessWidget {
  const InterestChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Interest",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 1.0,
            children: [
              InterestChip(
                label: "Movie",
                isSameInterest: true,
              ),
              InterestChip(
                label: "Photography",
                isSameInterest: true,
              ),
              InterestChip(label: "Design"),
              InterestChip(label: "Singing"),
              InterestChip(label: "Painting")
            ],
          ),
        ),
      ],
    );
  }
}

class InterestChip extends StatelessWidget {
  final String label;
  final bool isSameInterest;

  const InterestChip({
    super.key,
    required this.label,
    this.isSameInterest = false,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor:
          isSameInterest ? Theme.of(context).primaryColor : Colors.white,
      label: Text(
        label,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: isSameInterest ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSameInterest ? Colors.transparent : Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class SelfIntro extends StatelessWidget {
  final String title;
  final String text;

  const SelfIntro({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth * 0.95,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(style: Theme.of(context).textTheme.displayMedium, text),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imageUrl;

  const CustomCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.95,
      height: deviceHeight * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class CustomPhoto extends StatelessWidget {
  final String imageUrl;

  const CustomPhoto({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth * 0.95,
      height: deviceWidth * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
