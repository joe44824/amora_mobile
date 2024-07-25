import 'package:amora_mobile_app/ui/widgets/scaffold/onboard_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class GenderSelectorPage extends StatefulWidget {
  const GenderSelectorPage({super.key});

  @override
  State<GenderSelectorPage> createState() => _GenderSelectorPageState();
}

class _GenderSelectorPageState extends State<GenderSelectorPage> {
  List<Gender> genders = [];

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Male", MdiIcons.genderMale, false));
    genders.add(Gender("Female", MdiIcons.genderFemale, false));
    genders.add(Gender("Others", MdiIcons.genderTransgender, false));
  }

  @override
  Widget build(BuildContext context) {
    return OnboardScaffoldPage(
      title: "What's Your Gender?",
      description: "Tell us about yourself",
      continueCallback: () {},
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: genders.map((gender) {
              return MaterialButton(
                onPressed: () {
                  setState(() {
                    for (var gender in genders) {
                      gender.isSelected = false;
                    }
                    gender.isSelected = true;
                  });
                },
                child: CustomRadio(gender: gender),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class CustomRadio extends StatelessWidget {
  final Gender gender;

  const CustomRadio({super.key, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: gender.isSelected ? Theme.of(context).primaryColor : Colors.white,
      child: Container(
        height: 80,
        width: 75,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              gender.icon,
              color: gender.isSelected ? Colors.white : Colors.black,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              gender.name,
              style: TextStyle(
                color: gender.isSelected ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
