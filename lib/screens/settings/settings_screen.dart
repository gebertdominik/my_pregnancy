import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_pregnancy/constants/colors.dart';
import 'package:my_pregnancy/models/user_settings.dart';
import 'package:my_pregnancy/screens/home/home_screen.dart';
import 'package:my_pregnancy/screens/settings/settings_controller.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class NewSettingsScreen extends StatelessWidget {
  final SettingsController _settingsController = new SettingsController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: _settingsController.fetchUserSettings(_auth.currentUser.uid),
        builder: (context, snapshot) {
          UserSettings userSettings = snapshot.data;
          if (userSettings == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  height: size.height * 0.45,
                  decoration: BoxDecoration(color: kLightPinkColor),
                ),
                SettingsForm(userSettings)
              ],
            ),
          );
        });
  }
}

class SettingsForm extends StatefulWidget {
  final UserSettings userSettings;

  const SettingsForm(this.userSettings);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final SettingsController _settingsController = new SettingsController();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    initialValue: widget.userSettings.firstName,
                    onSaved: (String value) {
                      widget.userSettings.firstName = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            child: MyTextFormField(
              hintText: 'Baby Name',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your baby name';
                }
                return null;
              },
              initialValue: widget.userSettings.babyName,
              onSaved: (String value) {
                widget.userSettings.babyName = value;
              },
            ),
          ),
          RaisedButton(
            color: Colors.blueAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _settingsController.updateUserSettings(widget.userSettings);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            },
            child: Text(
              'Zapisz',
              style: TextStyle(
                color: Colors.white,
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
      child: OutlinedButton(
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

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final String initialValue;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.initialValue,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        initialValue: initialValue,
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
