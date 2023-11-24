import 'package:flutter_boiler_plate/app/modules/user_account_modules/sign_in/views/signin_screen.dart';
import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/views/signup_screen.dart';
import 'package:flutter/material.dart';

import '../components/Test/testing.dart';

import '../modules/chat_with_claude_model/views/chat_with_claude_model_screen.dart';

import '../modules/user_account_modules/cg_profile_modules/profile_update/views/profile_update_screen.dart';
import '../modules/user_account_modules/user_profille/view/user_profile_screen.dart';


enum ScreenNames {
  chat(screenName:"Chat",screenWidget: ChatWithClaudeModelScreen()),

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
