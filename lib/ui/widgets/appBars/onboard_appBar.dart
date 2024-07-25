import 'package:amora_mobile_app/ui/widgets/logos/app_logo.dart';
import 'package:amora_mobile_app/utils/helpers/helper_widgets.dart';
import 'package:flutter/material.dart';

class OnboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      actions: [AppLogo(size: 40), addHorizontalMargin()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
