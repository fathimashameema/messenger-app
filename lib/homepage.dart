import 'package:flutter/material.dart';
import 'package:messenger_app/loginpage.dart';
import 'package:messenger_app/secondarypage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class messenger extends StatefulWidget {
  const messenger({super.key});

  @override
  State<messenger> createState() => _messengerState();
}

// ignore: camel_case_types
class _messengerState extends State<messenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
        backgroundColor: const Color.fromARGB(255, 35, 59, 100),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/Grey and Beige Minimalist Simple Typographic Circular Podcast Logo.png'),
              ),
            ),
            Text(
              'My Messenger',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: index % 2 == 0
                  ? CircleAvatar(
                      backgroundColor: Colors.purple[800],
                      backgroundImage:
                          const AssetImage('assets/images/teddy.jpg'),
                    )
                  : ClipRRect(
                      child: Image.asset(
                        'assets/images/teddy.jpg',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
              title: Text('person ${index + 1}'),
              subtitle: const Text('something messages'),
              trailing: Text('${index + 1}:00 PM'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (cntxt) {
                  return Screentwo(name: 'person ${index + 1}');
                }));
              },
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 30),
    );
  }

  Future<void> signOut(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Loginpage()),
        (route) => false);

    showDialog(
        context: (context),
        builder: (cntxt) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple[50],
            title: const Text('Signing Out'),
            content: const Text('do you want to continue ?'),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(cntxt).pop();
                      },
                      child: const Text('Yes')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(cntxt).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => messenger()));
                      },
                      child: const Text('No'))
                ],
              ),
            ],
          );
        });
  }
}
