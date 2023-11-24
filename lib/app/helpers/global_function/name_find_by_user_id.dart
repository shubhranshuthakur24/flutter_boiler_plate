// import 'package:givershealths/app/modules/home/services/mixin_home_screen_api.dart';
// import 'package:givershealths/app/utils/sentry_and_error_related/sentry_function.dart';
//
// String nameFindByUserId({required int userId, required MixinHomeScreenApi mixinHomeScreenApi}) {
//   String name = "";
//   try {
//     if (mixinHomeScreenApi.homePageModel.value!.careGiverUserId?.trim() == userId.toString().trim()) {
//       name = "${mixinHomeScreenApi.homePageModel.value!.cgFirstName!} ${mixinHomeScreenApi.homePageModel.value!.cgLastName!}";
//       return name.trim();
//     }
//   } catch (ignoredError) {}
//   try {
//     name =
//         "${mixinHomeScreenApi.homePageModel.value!.navigatorData!.firstWhere((element) => element.navUserid == userId).navFirstName!} ${mixinHomeScreenApi.homePageModel.value!.navigatorData!.firstWhere((element) => element.navUserid == userId).navLastName!}";
//     return name.trim();
//   } catch (ignoredError) {}
//
//   if (name.trim().isEmpty) {
//     // SentryFunction.capturingMessages(errorMessage: "Name not founded for user id ${userId.toString()}");
//   }
//   return name.trim();
// }
