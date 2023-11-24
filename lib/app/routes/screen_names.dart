import 'package:flutter_boiler_plate/app/modules/user_account_modules/sign_in/views/signin_screen.dart';
import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/views/signup_screen.dart';
import 'package:flutter/material.dart';

import '../components/Test/testing.dart';
import '../modules/chat_search_with_csv_claude_model/views/chat_search_with_csv_claude_model_screen.dart';
import '../modules/chat_search_with_csv_open_ai_model/views/chat_search_with_csv_open_ai_model_screen.dart';
import '../modules/chat_search_with_pdf_claude_model/views/chat_search_with_pdf_claude_model_screen.dart';
import '../modules/chat_search_with_pdf_openai_model/views/chat_search_with_pdf_openai_model_screen.dart';
import '../modules/chat_with_claude_model/views/chat_with_claude_model_screen.dart';
import '../modules/chat_with_claude_model_new/views/chat_with_claude_model_screen_new.dart';
import '../modules/testScreen/views/test_screen.dart';
import '../modules/user_account_modules/cg_profile_modules/profile_update/views/profile_update_screen.dart';
import '../modules/user_account_modules/user_profille/view/user_profile_screen.dart';


enum ScreenNames {
  chat(screenName:"Chat",screenWidget: ChatWithClaudeModelScreen()),
  chatClaudePDF(screenName:"chatClaudePDF",screenWidget: ChatSearchWithPdfClaudeModelScreen()),
  chatOpenAIPDF(screenName:"chatOpenAIPDF",screenWidget: ChatSearchWithPdfOpenAIModelScreen()),
  chatClaudeCSV(screenName:"chatClaudeCSV",screenWidget: ChatSearchWithCsvClaudeModelScreen()),
  chatOpenAICSV(screenName:"chatOpenAICSV",screenWidget: ChatSearchWithCsvOpenAIModelScreen()),
  history(screenName:"history",screenWidget: ChatSearchWithCsvOpenAIModelScreen()),
  support(screenName:"support",screenWidget: ChatSearchWithCsvOpenAIModelScreen()),
  feedback(screenName:"feedback",screenWidget: ChatSearchWithCsvOpenAIModelScreen()),
  profile(screenName:"profile",screenWidget: ProfileScreen()),
  editProfile(screenName:"editProfile",screenWidget: ProfileUpdateScreen()),
  signOut(screenName:"signOut",screenWidget: ChatSearchWithCsvOpenAIModelScreen()),
  signIn(screenName:"signIn",screenWidget: SignInScreen()),
  signUp(screenName:"signUp",screenWidget: SignUpScreen()),
  testScreen(screenName:"testScreen",screenWidget: TestScreen()),
  chatWithClaudeNew(screenName:"chatWithClaudeNew",screenWidget: ChatWithClaudeModelScreenNew()),
  testExampleScreen(screenName:"chatWithClaudeNew",screenWidget: ExampleFilePicker()),
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
