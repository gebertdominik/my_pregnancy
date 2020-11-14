import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_pregnancy/constants/colors.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(color: kLightPinkColor),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ustawienia",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SignOutButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        OutlinedButton(
          child: Text('Wyloguj'),
          onPressed: () async {
            final User user = await _auth.currentUser;
            if (user == null) {
              Scaffold.of(context).showSnackBar(const SnackBar(
                content: Text('Nie jesteś zalogowana'),
              ));
              return;
            }
            _signOut();
            _backToMain(context);
            final String uid = user.uid;
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(uid + ' pozytywnie wylogowany'),
            ));
          },
        ),
    );
  }
}

// Example code for sign out.
void _signOut() async {
  await _auth.signOut();
}

void _backToMain(BuildContext context) {
  Navigator.popUntil(context, ModalRoute.withName("/"));
}
