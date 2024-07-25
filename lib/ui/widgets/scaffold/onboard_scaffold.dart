import 'package:amora_mobile_app/ui/widgets/buttons/elevated_button.dart';
import 'package:amora_mobile_app/utils/helpers/helper_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardScaffoldPage extends StatefulWidget {
  const OnboardScaffoldPage({
    super.key,
    required this.title,
    required this.description,
    required this.child,
    required this.continueCallback,
  });

  final String title;
  final String description;
  final Widget child;
  final VoidCallback continueCallback;

  @override
  State<OnboardScaffoldPage> createState() => _OnboardScaffoldPageState();
}

class _OnboardScaffoldPageState extends State<OnboardScaffoldPage> {
  final double _progressValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: CustomProgressIndicator(progressValue: _progressValue),
        actions: [
          SvgPicture.asset(
            "assets/app_logo.svg",
            height: 40,
          ),
          addHorizontalMargin()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            addVerticalMargin(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.description,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            addVerticalMargin(),
            Flexible(
              fit: FlexFit.loose,
              child: widget.child,
            ),
            addVerticalMargin(height: 30),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: CustomElevatedButton(
                onPressed: widget.continueCallback,
                text: "Continue",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required double progressValue,
  }) : _progressValue = progressValue;

  final double _progressValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: LinearProgressIndicator(
        minHeight: 10,
        borderRadius: BorderRadius.circular(20),
        value: _progressValue / 4,
        backgroundColor: Theme.of(context).canvasColor,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
