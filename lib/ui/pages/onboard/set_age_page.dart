import 'package:amora_mobile_app/ui/widgets/scaffold/onboard_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SetAgePage extends StatefulWidget {
  const SetAgePage({super.key});

  @override
  State<SetAgePage> createState() => _SetAgePageState();
}

class _SetAgePageState extends State<SetAgePage> {
  int _currentValue = 25;

  @override
  Widget build(BuildContext context) {
    return OnboardScaffoldPage(
      continueCallback: () {},
      title: "How old are you?",
      description: "Please provide your age in years",
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: NumberPicker(
          value: _currentValue,
          itemCount: 7,
          minValue: 18,
          maxValue: 70,
          haptics: true,
          itemHeight: 60,
          onChanged: (value) => setState(() => _currentValue = value),
          textStyle: const TextStyle(fontSize: 32),
          selectedTextStyle: TextStyle(
              fontSize: 55,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
