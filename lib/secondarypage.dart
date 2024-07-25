import 'package:flutter/material.dart';

class Screentwo extends StatelessWidget {
  final String name;

  const Screentwo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.backspace,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 59, 100),
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text('messages...')),
    );
  }
}
