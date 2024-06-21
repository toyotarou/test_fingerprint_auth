import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Column(
          children: [
            Text('SecondScreen'),
          ],
        ),
      ),
    );
  }
}
