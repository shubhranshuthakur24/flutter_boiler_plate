import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen_names.dart';



class MiddlewareForSignOutScreens extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Retrieve parameters from the URL
    Map<String, String?> parameters = Get.parameters;

    // Check for a specific parameter that indicates the screen name
    if (parameters.containsKey('screenName')) {
      String screenName = parameters['screenName']!;

      // Switch case to handle different screen names
      switch (screenName) {
        case 'chat':
          return RouteSettings(name: ScreenNames.chat.routeName);
        case 'chatClaudePDF':
          return RouteSettings(name: ScreenNames.chatClaudePDF.routeName);
        case 'chatOpenAIPDF':
          return RouteSettings(name: ScreenNames.chatOpenAIPDF.routeName);
        case 'chatOpenAICSV':
          return RouteSettings(name: ScreenNames.chatOpenAICSV.routeName);
        case 'chatClaudeCSV':
          return RouteSettings(name: ScreenNames.chatClaudeCSV.routeName);
        case 'history':
          return RouteSettings(name: ScreenNames.history.routeName);
        case 'support':
          return RouteSettings(name: ScreenNames.support.routeName);
        case 'feedback':
          return RouteSettings(name: ScreenNames.feedback.routeName);
        case 'profile':
          return RouteSettings(name: ScreenNames.profile.routeName);
        case 'signOut':
          return RouteSettings(name: ScreenNames.signOut.routeName);
        case 'signIn':
          return RouteSettings(name: ScreenNames.signIn.routeName);
        case 'signUp':
          return RouteSettings(name: ScreenNames.signUp.routeName);
        case 'testScreen':
          return RouteSettings(name: ScreenNames.testScreen.routeName);
        default:
        // Handle unknown screen names or redirect to a default route
          return RouteSettings(name: '/');
      }
    }

    // If user is authenticated, redirect to the chat route
    if (FirebaseAuth.instance.currentUser != null) {
      return RouteSettings(name: ScreenNames.chat.routeName);
    }

    // If not authenticated, allow normal navigation
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('--login middleware .. ${page?.name}');
    return super.onPageCalled(page);
  }
}
