import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:my_pregnancy/constants/colors.dart';
import 'package:my_pregnancy/widgets/email_password_sign_in_form.dart';

import './auth/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// The entry point of the application.
///
/// Returns a [MaterialApp].
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PregApp',
        theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: AuthTypeSelector(),
        ));
  }
}

/// Provides a UI to select a authentication type page
class AuthTypeSelector extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(children: [
          Container(
            width: double.maxFinite,
            alignment: Alignment.center,
          ),
          Image(image: AssetImage('assets/images/logo.png')),
          Container(
            child: EmailPasswordForm(),
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: kLightPinkColor,
              text: 'Rejestracja',
              textColor: kBackgroundColor,
              iconColor: kBackgroundColor,
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ]),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
