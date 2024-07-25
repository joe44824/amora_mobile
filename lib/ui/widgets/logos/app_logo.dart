// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget AppLogo({double size = 150}) {
  return SvgPicture.asset(
    "assets/app_logo.svg",
    width: size,
    height: size,
    fit: BoxFit.contain,
  );
}
