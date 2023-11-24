import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MiddlewareForSignInScreenScreens extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (FirebaseAuth.instance.currentUser == null) {
      return const RouteSettings(name: '/');

    } else if (FirebaseAuth.instance.currentUser != null) {
    }
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('--MiddlewareForSignInScreenScreens .. ${page?.name}');
    return super.onPageCalled(page);
  }
}






