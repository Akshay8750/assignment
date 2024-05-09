import 'package:assignment/di_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bottom_bar_screen.dart';
import 'generated/l10n.dart';
import 'theme/app_theme.dart';

/// global navigation key
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// initializing the screen unit library and
    /// setting up the design width and height
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          /// initialize DI container
          DISetup.setup();
          return GetMaterialApp(

              ///Remove Debug tag from top right corner
              debugShowCheckedModeBanner: false,

              ///setup navigation key
              navigatorKey: navigatorKey,

              ///light theme of app
              theme: AppTheme.lightTheme,

              ///dark light theme of app (same for now)
              darkTheme: AppTheme.lightTheme,

              /// setting up localisation delegates for the app
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              /// this line set up the languages we use in our app
              supportedLocales: S.delegate.supportedLocales,
              locale: const Locale('en'),

              /// app home page
              home: const BottomBarScreen());
        });
  }
}
