
import 'package:flutter_boiler_plate/app/modules/user_account_modules/sign_in/services/sign_in_screen_services.dart';
import 'package:flutter_boiler_plate/app/modules/user_account_modules/sign_in/views/signin_screen.dart';
import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/services/signup_screen_services.dart';
import 'package:flutter_boiler_plate/app/routes/screen_names.dart';
import 'package:get/get.dart';


import '../modules/home_screen/services/home_screen_services.dart';
import '../modules/user_account_modules/profile_modules/profile/services/user_profile_services.dart';
import '../modules/user_account_modules/profile_modules/profile_update/services/profile_update_services.dart';
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
      screenNameEnums: ScreenNames.home,
      middlewareList: [MiddlewareForSignInScreenScreens()],
      bindings: [
        BindingsBuilder(() {
          Get.delete<HomeScreenServices>(force: true);
          Get.put(HomeScreenServices());
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



