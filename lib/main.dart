import 'package:detict_age/screens/Home/edit_profile.dart';
import 'package:detict_age/screens/Home/view.dart';
import 'package:detict_age/screens/splash/views.dart';
import 'package:detict_age/theme/dark_theme.dart';
import 'package:detict_age/theme/light_theme.dart';
import 'package:detict_age/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'helper/cache_helper.dart';
import 'helper/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();

  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/languages/',
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    LocalizedApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: light,
      darkTheme: light,
      home: SplashScreen(),
      localizationsDelegates: translator.delegates, // Android + iOS Delegates
      locale: translator.locale, // Active locale
      supportedLocales: translator.locals(),
    );
  }
}
