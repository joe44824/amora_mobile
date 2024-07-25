import 'package:amora_mobile_app/ui/widgets/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Center(
        child: Text("Nearby Page"),
      ),
    );
  }
}
