import 'package:flutter/material.dart';
import 'package:spades/app/auth_widget.dart';
import 'package:spades/app/sign_in/email_password/email_password_sign_in_page.dart';
import 'package:spades/app/lobby/lobby_page.dart';
class Routes {
  static const authWidget = '/';
  static const emailPasswordSignInPageBuilder =
      '/email-password-sign-in-page-builder';
  static const landingPage = '/lobby';
}

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.authWidget:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AuthWidget(userSnapshot: args),
          settings: settings,
        );
      case Routes.emailPasswordSignInPageBuilder:
        return MaterialPageRoute<dynamic>(
          builder: (_) => EmailPasswordSignInPageBuilder(onSignedIn: args),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.landingPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LandingPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        // TODO: Throw
        return null;
    }
  }
}
