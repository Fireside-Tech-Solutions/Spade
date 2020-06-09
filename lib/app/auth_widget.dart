import 'package:spades/app/lobby/lobby_page.dart';
import 'package:spades/app/account/account_page.dart';
import 'package:spades/app/lobby/lobby_page.dart';
import 'package:spades/app/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:spades/services/firebase_auth_service.dart';

/// Builds the signed-in or non signed-in UI, depending on the user snapshot.
/// This widget should be below the [MaterialApp].
/// An [AuthWidgetBuilder] ancestor is required for this widget to work.
/// Note: this class used to be called [LandingPage].
class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? LandingPage() : SignInPageBuilder();
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
