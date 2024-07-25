import 'package:amora_mobile_app/ui/widgets/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
