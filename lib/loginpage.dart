import 'package:flutter/material.dart';
import 'package:messenger_app/homepage.dart';
import 'package:messenger_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool errormessage = true;
  final formkey = GlobalKey<FormState>();
  final String ogusername = 'shameema';
  final ogpassword = 'shem123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 105, 101, 132),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 370,
            height: 400,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 105, 101, 132),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Create Account :',
                            style: TextStyle(
                                color: Color.fromARGB(255, 251, 247, 252),
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter the username';
                        } else if (value != ogusername) {
                          return 'invalid username';
                        } else {
                          return null;
                        }
                      },
                      controller: usernamecontroller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 251, 247, 252),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter the password';
                        } else if (value != ogpassword) {
                          return 'invalid password';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 251, 247, 252),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.deepPurple)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        formkey.currentState!.validate();
                        userLogin(context);
                      },
                      label: const Text('login'),
                      icon: const Icon(Icons.check),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void userLogin(BuildContext cntxt) async {
    final username = usernamecontroller.text;
    final password = passwordcontroller.text;

    const String error = 'invalid entry';

    if (username == ogusername && password == ogpassword) {
      final _sharedpref = await SharedPreferences.getInstance();
      await _sharedpref.setBool(DATA_KEY, true);
      Navigator.of(cntxt).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const messenger()));
    } else {
      setState(() {
        const Text(error);
      });
    }
  }
}
