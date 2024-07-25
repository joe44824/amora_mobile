import 'dart:async';

import 'package:amora_mobile_app/ui/pages/swipe/swipe_page.dart';
import 'package:amora_mobile_app/ui/widgets/appBars/onboard_appBar.dart';
import 'package:amora_mobile_app/ui/widgets/buttons/elevated_button.dart';
import 'package:amora_mobile_app/utils/helpers/helper_widgets.dart';
import 'package:amora_mobile_app/utils/navigation/custom_navigator.dart';
import 'package:amora_mobile_app/utils/theme/custom_themes/pin_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  final String vid;
  final String phoneNumber;

  const OtpPage({super.key, this.vid = "testing", required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var code = '';

  var isWrongCode = false;
  late Timer _timer;
  int _secondsRemaining = 30;
  bool _isResendAvailable = false;

  void signIn() async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: widget.vid, smsCode: code);

    setState(() {
      isWrongCode = true;
    });

    try {
      await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) => CustomNavigator.navigateOfAll(context, const SwipePage()));
    } catch (e) {
      setState(() {
        isWrongCode = true;
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _isResendAvailable = true;
        }
      });
    });
  }

  void _resendOTP() {
    // Implement resend OTP logic here
    setState(() {
      _isResendAvailable = false;
      _secondsRemaining = 30; // Reset timer
      _startTimer(); // Start timer again
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const OnboardAppBar(),
      body: SingleChildScrollView(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          children: [
            addVerticalMargin(height: 50),
            Text(
              "Verify Phone Number",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            addVerticalMargin(),
            RichText(
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 15),
                children: [
                  const TextSpan(
                    text:
                        "We've sent an SMS with an activation code to your phone ",
                  ),
                  TextSpan(
                    text: widget.phoneNumber,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            addVerticalMargin(height: 50),
            textCode(),
            addVerticalMargin(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Send code again ${_secondsRemaining.toString().padLeft(2, '0')}',
                ),
                _isResendAvailable
                    ? MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          "Send OTP again",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(onPressed: signIn, text: "Verify")
          ],
        ),
      ),
    );
  }

  Widget verifyButton() {
    return Center(
      child: CustomElevatedButton(
        onPressed: signIn,
        text: "Verify",
      ),
    );
  }

  Widget textCode() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Pinput(
          crossAxisAlignment: CrossAxisAlignment.center,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          errorPinTheme: errorPinTheme,
          validator: (_) {
            return isWrongCode ? 'Wrong code, please try again' : null;
          },
          onCompleted: (_) => signIn(),
          length: 6,
          onChanged: (value) {
            setState(
              () {
                code = value;
              },
            );
          },
        ),
      ),
    );
  }
}
