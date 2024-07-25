import 'package:flutter/material.dart';
import 'package:messenger_app/homepage.dart';
import 'package:messenger_app/loginpage.dart';
import 'package:messenger_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    entryCheck();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 59, 100),
      body: Center(
        child: Image.asset(
          'assets/images/Grey and Beige Minimalist Simple Typographic Circular Podcast Logo.png',
          width: 300,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> goTOLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Loginpage(),
      ),
    );
  }

  Future<void> entryCheck() async {
    final _sharedpref = await SharedPreferences.getInstance();
    final userLogged = _sharedpref.getBool(DATA_KEY);
    if (userLogged == null || userLogged == false) {
      goTOLogin();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (cntxt) => messenger(),
      ));
    }
  }
}
