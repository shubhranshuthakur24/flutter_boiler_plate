import 'package:flutter_boiler_plate/app/modules/user_account_modules/sign_in/views/signin_screen.dart';
import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/views/signup_screen.dart';
import 'package:flutter/material.dart';



import '../modules/home_screen/views/home_screen.dart';
import '../modules/user_account_modules/profile_modules/profile/views/user_profile_screen.dart';
import '../modules/user_account_modules/profile_modules/profile_update/views/profile_update_screen.dart';


enum ScreenNames {
  home(screenName:"home",screenWidget: HomeScreen()),

  profile(screenName:"profile",screenWidget: ProfileScreen()),
  editProfile(screenName:"editProfile",screenWidget: ProfileUpdateScreen()),
  signIn(screenName:"signIn",screenWidget: SignInScreen()),
  signUp(screenName:"signUp",screenWidget: SignUpScreen()),
  ;


  const ScreenNames({required this.screenName, required this.screenWidget});
  final String screenName;
  final Widget screenWidget;
}

extension GetRouteName on ScreenNames {
  String get routeName {
    ScreenNames screenNames = this;
    return "/${screenNames.name}";
  }
}
