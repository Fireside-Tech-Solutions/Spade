import 'dart:async';
import 'package:spades/common_widgets/avatar.dart';
import 'package:spades/common_widgets/players_horizantal_listview.dart';
import 'package:spades/common_widgets/show_alert_dialog.dart';
import 'package:spades/common_widgets/show_exception_alert_dialog.dart';
import 'package:spades/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spades/routing/router.dart';
import 'package:spades/services/firebase_auth_service.dart';
import 'package:pedantic/pedantic.dart';

class AccountPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final FirebaseAuthService auth =
          Provider.of<FirebaseAuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: Strings.logoutFailed,
        exception: e,
      ));
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: Strings.logout,
          content: Strings.logoutAreYouSure,
          cancelActionText: Strings.cancel,
          defaultActionText: Strings.logout,
        ) ??
        false;
    if (didRequestSignOut == true) {
      await _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Must remove later now for testing to test profile image that dont work
    final user = Provider.of<User>(context);
    return  Scaffold( 
      appBar: AppBar( 
        backgroundColor: Color(0xFF2430346),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Row(
            children: <Widget>[
            IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              Routes.landingPage;
            },
            ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0, bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Avatar(
                        photoUrl: user.photoUrl,
                        radius: 40,
                        borderColor: Colors.black54,
                        borderWidth: 2.0,
                      ),
                      Text(
                        "@username",
                        style: new TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )
                      )
                    ],
                  ),
                ),
              ),
               Expanded(
                  child:Padding(
                padding: const EdgeInsets.only(right:70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "My Partner",
                      style: new TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ), 
                    ),
                    Text(
                      "Dorian",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "@Doetheman",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "128 Games Played",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "117 Wins",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    body: ProfileList()
    );
  }
}
