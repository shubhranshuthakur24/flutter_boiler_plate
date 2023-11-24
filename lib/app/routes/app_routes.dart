import 'package:chat_app/app/modules/chat_search_with_csv_claude_model/services/chat_search_with_csv_claude_model_screen_services.dart';
import 'package:chat_app/app/modules/chat_with_claude_model/views/chat_with_claude_model_screen.dart';
import 'package:chat_app/app/modules/testScreen/views/test_screen.dart';
import 'package:chat_app/app/modules/user_account_modules/sign_in/services/sign_in_screen_services.dart';
import 'package:chat_app/app/modules/user_account_modules/sign_in/views/signin_screen.dart';
import 'package:chat_app/app/modules/user_account_modules/signup/services/signup_screen_services.dart';
import 'package:chat_app/app/modules/user_account_modules/user_profille/services/user_profile_services.dart';
import 'package:chat_app/app/routes/screen_names.dart';
import 'package:get/get.dart';


import '../modules/chat_search_with_csv_open_ai_model/services/chat_search_with_csv_open_ai_model_screen_services.dart';
import '../modules/chat_search_with_pdf_claude_model/services/chat_search_with_pdf_claude_model_screen_services.dart';
import '../modules/chat_search_with_pdf_openai_model/services/chat_search_with_pdf_openai_model_screen_services.dart';
import '../modules/chat_with_claude_model/services/chat_with_claude_model_screen_services.dart';
import '../modules/chat_with_claude_model_new/services/chat_with_claude_model_screen_services.dart';
import '../modules/testScreen/services/test_screen_services.dart';
import '../modules/user_account_modules/cg_profile_modules/profile_update/services/profile_update_services.dart';
import 'middlewares/middleware_for_sign_in_screens.dart';
import 'middlewares/middleware_for_sign_out_screens.dart';

import 'package:get/get.dart';



abstract class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => const SignInScreen(),
      middlewares: [MiddlewareForSignOutScreens()],
      bindings: [
        BindingsBuilder(() {
          // Get.delete<SignInScreenServices>();
          Get.lazyPut(() => SignInScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.signIn,
      middlewareList: [MiddlewareForSignOutScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<SignInScreenServices>(force: true);
          Get.put(SignInScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.chat,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<ChatWithClaudeModelScreenServices>(force: true);
          Get.put(ChatWithClaudeModelScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.chatClaudePDF,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<ChatSearchWithCsvOpenAIModelScreenServices>(force: true);
          Get.put(ChatSearchWithPdfClaudeModelScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.chatOpenAICSV,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<ChatSearchWithCsvOpenAIModelScreenServices>(force: true);
          Get.put(ChatSearchWithCsvOpenAIModelScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.chatOpenAIPDF,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<ChatSearchWithCsvOpenAIModelScreenServices>(force: true);
          Get.put(ChatSearchWithPdfOpenAIModelScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.chatClaudeCSV,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<ChatSearchWithCsvClaudeModelScreenServices>(force: true);
          Get.put(ChatSearchWithCsvClaudeModelScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.signIn,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<SignInScreenServices>(force: true);
          Get.put(SignInScreenServices());
        }),
      ],
    ),
    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.signUp,
      middlewareList: [MiddlewareForSignOutScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<SignupScreenServices>(force: true);
          Get.put(SignupScreenServices());
        }),
      ],
    ),

    _setToNamedRoute(
      transition: Transition.noTransition,
      screenNameEnums: ScreenNames.testScreen,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<TestScreenServices>(force: true);
          Get.put(TestScreenServices());
        }),]),

    _setToNamedRoute(
        transition: Transition.noTransition,
        screenNameEnums: ScreenNames.chatWithClaudeNew,
        middlewareList: [MiddlewareForSignInScreenScreens()],
        bindings: [
          BindingsBuilder(() {
            Get.delete<ChatWithClaudeModelScreenServicesNew>(force: true);
            Get.put(ChatWithClaudeModelScreenServicesNew());
          }),]),
    _setToNamedRoute(
        transition: Transition.noTransition,
        screenNameEnums: ScreenNames.profile,
        middlewareList: [MiddlewareForSignInScreenScreens()],
        bindings: [
          BindingsBuilder(() {
            Get.delete<ProfileScreenServices>(force: true);
            Get.put(ProfileScreenServices());
          }),]),
    _setToNamedRoute(
        transition: Transition.noTransition,
        screenNameEnums: ScreenNames.editProfile,
        middlewareList: [MiddlewareForSignInScreenScreens()],
        bindings: [
          BindingsBuilder(() {
            Get.delete<ProfileUpdateServices>(force: true);
            Get.put(ProfileUpdateServices());
          }),]),
    _setToNamedRoute(
        transition: Transition.noTransition,
        screenNameEnums: ScreenNames.testExampleScreen,
        middlewareList: [MiddlewareForSignInScreenScreens()],
        bindings: [
          BindingsBuilder(() {
            // Get.delete<ProfileScreenServices>(force: true);
            // Get.put(ProfileScreenServices());
          }),]),


  ];

  // static GetPage _setToNamedRoute(
  //     {required ScreenNames screenNameEnums,
  //       Transition? transition,
  //       List<GetMiddleware>? middlewareList,
  //       List<Bindings>? bindings}) {
  //   return GetPage(
  //     middlewares: middlewareList,
  //     name: screenNameEnums.routeName,
  //     page: () => screenNameEnums.screenWidget,
  //     transition: transition,
  //     bindings: bindings ?? [],
  //   );
  // }
  static GetPage _setToNamedRoute(
      {required ScreenNames screenNameEnums,
        Transition? transition,
        List<GetMiddleware>? middlewareList,
        List<Bindings>? bindings}) {
    return GetPage(
      name: screenNameEnums.routeName,
      page: () => screenNameEnums.screenWidget,
      transition: transition,
      middlewares: middlewareList,
      bindings: bindings ?? [],
    );
  }
}



