// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:messenger_app/splashscreen.dart';

const DATA_KEY = 'user data';

void main(List<String> args) {
  runApp(const MyMessenger());
}

class MyMessenger extends StatelessWidget {
  const MyMessenger({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: const Splashscreen(),
    );
  }
}
