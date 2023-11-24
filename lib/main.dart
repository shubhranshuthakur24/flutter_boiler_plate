import 'package:flutter_boiler_plate/app/styles/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'app/helpers/token_services/token_services.dart';
import 'app/routes/app_routes.dart';
import 'app/routes/url_startgery_for_hash_symbol_remove_from_ulrs/configure_web.dart';
import 'app/styles/constants.dart';
import 'app/utils/device_related/device_identify.dart';
import 'firebase_options.dart';
// import 'firebase_options.dart'; // configure firebase with cli  and uncomment this


RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class _FToastHolder extends StatelessWidget {
  const _FToastHolder({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Overlay overlay = Overlay(
      initialEntries: <OverlayEntry>[
        OverlayEntry(
          builder: (BuildContext ctx) {
            return child;
          },
        ),
      ],
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: overlay,
    );
  }
}


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();




Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureApp();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); //  configure firebase with cli  and uncomment this
  // Get.put(TokenServices(), permanent: true);
  // changeFontSizeAccordingToDevice();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // st
    statusBarIconBrightness: Brightness.dark, //// atus bar color
  ));
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!kDeviceIsWeb()) {}
    // FlutterNativeSplash.remove();


    return GetMaterialApp(
      builder: (context, child) {
        return _FToastHolder(
          child: child!,
        );
      },
      navigatorKey: navigatorKey,
      initialRoute: "/",
      getPages: AppRoutes.routes,
      routingCallback: (Routing? routing) {
        Get.put(TokenServices(), permanent: true);
      },
      // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics), routeObserver],
      title: "ER-Triage - ChatBox",
      // translations: TranslationsClass(),
      // locale: Locale(selectedPreferredLanguageMapping.languageCode, selectedPreferredLanguageMapping.countryCode),
      // locale: const Locale('es', 'ES'),
      fallbackLocale: const Locale('en', 'US'),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: kColorBlueDark,
        fontFamily: constantOpenSans,
      ),
      debugShowCheckedModeBanner: false,
    );
    //   GetMaterialApp(
    //   initialRoute: "/",
    //   routingCallback: (Routing? routing) {
    //   },
    //   getPages: AppRoutes.routes,
    //   // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics), seoRouteObserver],
    //   title: "Stanford Emergency Medicine Triage Bot",
    //   locale: const Locale('en', 'US'),
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primaryColor: kColorMaroon,
    //     fontFamily: constantOpenSans,
    //   ),
    // );
  }
}


