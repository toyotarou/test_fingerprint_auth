import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  login() async {
    bool isAvailable;
    isAvailable = await auth.canCheckBiometrics;

    if (isAvailable) {
      bool result = await auth.authenticate(
        localizedReason: 'ログインのために指紋を照合してね',
      );

      if (result) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SecondScreen(),
          ),
        );
      } else {
        print('permission denied');
      }
    } else {
      print('Login Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                login();
              },
              icon: const Icon(Icons.fingerprint),
              label: const Text('fingerprint'),
            )
          ],
        ),
      ),
    );
  }
}
