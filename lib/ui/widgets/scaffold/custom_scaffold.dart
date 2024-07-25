import 'package:amora_mobile_app/utils/helpers/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerButton(),
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset("assets/app_logo_2.svg"),
        actions: [
          SvgPicture.asset("assets/app_bar_setting_icon.svg"),
          addHorizontalMargin()
        ],
      ),
      body: body,
    );
  }
}
