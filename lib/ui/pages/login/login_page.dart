// ignore_for_file: non_constant_identifier_names

import 'package:amora_mobile_app/ui/pages/login/phone_auth_page.dart';
import 'package:amora_mobile_app/ui/widgets/buttons/elevated_button.dart';
import 'package:amora_mobile_app/ui/widgets/logos/app_logo.dart';
import 'package:amora_mobile_app/utils/helpers/helper_widgets.dart';
import 'package:amora_mobile_app/utils/navigation/custom_navigator.dart';
import 'package:amora_mobile_app/utils/navigation/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(googleAuthProvider);

      // Wait for the auth state changes to reflect the updated user information
      _auth.authStateChanges().listen((event) {
        if (event != null) {
          // Navigate to Wrapper if the user is not null
          CustomNavigator.navigateOfAll(context, const Wrapper());
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          AppLogo(),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Welcome to Amora",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            "Please log in to continue",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomElevatedButton(onPressed: () {}, text: "Continue with E-mail"),
          CustomElevatedButton(
            onPressed: () =>
                CustomNavigator.navigateTo(context, const PhoneAuthPage()),
            text: "Continue with Phone Number",
            isWhite: true,
          ),
          const SizedBox(
            height: 30,
          ),
          HorizontalLineText(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSignInButton(
                brand: Brands.google,
                onPressed: _handleGoogleSignIn,
                name: "Google",
              ),
              addHorizontalMargin(),
              CustomSignInButton(
                brand: Brands.facebook,
                onPressed: () {},
                name: "Facebook",
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          const CustomTermsConditions()
        ],
      ),
    );
  }
}

class CustomTermsConditions extends StatelessWidget {
  const CustomTermsConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'I accept all the \n',
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms & Conditions',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          const TextSpan(
            text: ' & ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).primaryColor),
          )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class CustomSignInButton extends StatelessWidget {
  final String brand;
  final VoidCallback onPressed;
  final String name;

  const CustomSignInButton({
    super.key,
    required this.brand,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Brand(brand, size: 23),
      label: Text(
        name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Colors.black, width: 0.1),
      ),
    );
  }
}

Widget HorizontalLineText() {
  const thickness = 0.2;
  const text = "Or Sign up with";
  const color = Colors.black;

  return Row(
    children: [
      addHorizontalMargin(),
      const Expanded(
        child: Divider(
          thickness: thickness,
          color: color,
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          text,
        ),
      ),
      const Expanded(
        child: Divider(
          thickness: thickness,
          color: color,
        ),
      ),
      addHorizontalMargin(),
    ],
  );
}
