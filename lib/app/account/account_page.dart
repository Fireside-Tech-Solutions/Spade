import 'dart:async';

import 'package:spades/common_widgets/avatar.dart';
import 'package:spades/common_widgets/show_alert_dialog.dart';
import 'package:spades/common_widgets/show_exception_alert_dialog.dart';
import 'package:spades/constants/keys.dart';
import 'package:spades/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return  Scaffold(        
      body: Stack(
        children: <Widget>[ 
          Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ Color(0xFF430346), Colors.white],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomRight),
          ),
           child: Center(
            child: Text('Gradients are cool!'),
           ),
          ),
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: Text(Strings.account),
              backgroundColor: Colors.transparent,)
      ),]
    ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   final user = Provider.of<User>(context);
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text(Strings.account),
  //         bottom: PreferredSize(
  //           preferredSize: const Size.fromHeight(130.0),
  //           child: _buildUserInfo(user),
  //         ),
  //       ),
  //     body: Container(
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //             colors: [ Color(0x430346), Color(0xFFFFFF)],
  //             begin: FractionalOffset.topLeft,
  //             end: FractionalOffset.bottomRight,
  //            ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildUserInfo(User user) {
    return Column(
      children: [
        Avatar(
          photoUrl: user.photoUrl,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 2.0,
        ),
        const SizedBox(height: 8),
        if (user.displayName != null)
          Text(
            user.displayName,
            style: TextStyle(color: Colors.white),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}
