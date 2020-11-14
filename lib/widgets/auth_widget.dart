import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:my_pregnancy/auth/register_page.dart';
import 'package:my_pregnancy/constants/colors.dart';

import 'email_password_sign_in_form.dart';

/// Provides a UI to select a authentication type page
class AuthWidget extends StatelessWidget {
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