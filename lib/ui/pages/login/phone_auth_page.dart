// ignore_for_file: non_constant_identifier_names

import 'package:amora_mobile_app/ui/pages/login/otp_page.dart';
import 'package:amora_mobile_app/ui/widgets/buttons/elevated_button.dart';
import 'package:amora_mobile_app/ui/widgets/logos/app_logo.dart';
import 'package:amora_mobile_app/utils/helpers/helper_widgets.dart';
import 'package:amora_mobile_app/utils/helpers/snacbar.dart';
import 'package:amora_mobile_app/utils/navigation/custom_navigator.dart';
import 'package:country_flags/country_flags.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  String currentCountryCode = "US";
  String currentCountryName = "United States";
  String currentPhoneNumber = "";

  TextEditingController phoneNumberController = TextEditingController();

  void sendCode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: currentPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          showCustomSnackBar(context, Text(e.code));
        },
        codeSent: (String vid, int? token) {
          CustomNavigator.navigateTo(
              context,
              OtpPage(
                vid: vid,
                phoneNumber: currentPhoneNumber,
              ));
        },
        codeAutoRetrievalTimeout: (vid) {},
      );
    } on FirebaseAuthException catch (e) {
      showCustomSnackBar(context, Text(e.code));
    } catch (e) {
      showCustomSnackBar(context, Text(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const AuthAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalMargin(height: 50),
                Text("Log in", style: Theme.of(context).textTheme.labelMedium),
                addVerticalMargin(),
                Text(
                  "Please confirm your country code and enter your phone number.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                addVerticalMargin(height: 50),
                const CustomDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CountryFlagWithBorder(currentCountryCode),
                      addHorizontalMargin(),
                      Text(
                        currentCountryName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
                const CustomDivider(),
                IntlPhoneField(
                  controller: phoneNumberController,
                  showCountryFlag: false,
                  showDropdownIcon: true,
                  disableLengthCheck: false,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                  dropdownTextStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                  focusNode: focusNode,
                  languageCode: "en",
                  onChanged: (phone) {
                    currentPhoneNumber = phone.completeNumber;
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ${country.code}');
                    setState(() {
                      currentCountryCode = country.code;
                      currentCountryName = country.name;
                    });
                  },
                ),
                addVerticalMargin(),
                addVerticalMargin(height: 50),
                CustomElevatedButton(onPressed: sendCode, text: "Continue"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

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

Widget CountryFlagWithBorder(String countryCode) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1),
      border: Border.all(
        color: Colors.black, // Adjust the color of the border as needed
        width: 0.1, // Adjust the width of the border as needed
      ),
    ),
    child: CountryFlag.fromCountryCode(
      countryCode,
      height: 30,
      width: 42,
    ),
  );
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      color: Theme.of(context).dividerColor,
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double height;

  const CustomVerticalDivider({
    super.key,
    this.thickness = 0.4,
    this.color = Colors.black,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: thickness,
      height: height,
      child: Container(color: color),
    );
  }
}
