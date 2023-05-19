import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

ThemeData light = ThemeData(
  //fontFamily: 'TitilliumWeb',
  primaryColor: Color(0xFF00BCD4),
  brightness: Brightness.light,
  highlightColor: Colors.white,
  hintColor: Color(0xFF9E9E9E),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),


  // card view theme
  cardTheme: CardTheme(
    color: ColorManager.white,
    shadowColor: ColorManager.grey,
    elevation: 4,),


  // app bar theme
  appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      //elevation:  4,
      shadowColor: ColorManager.lightPrimary,
      //titleTextStyle: getRegularStyle(fontSize:   16, color: ColorManager.white)
  ),



  // bottom theme
  buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary),

  // elevated button them
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 12)))),


  // text theme
  textTheme: TextTheme(
      // displayLarge: getSemiBoldStyle( color: ColorManager.darkGrey, fontSize:   16 ),
      // headlineLarge: getSemiBoldStyle( color: ColorManager.darkGrey, fontSize:   16 ),
      // headlineMedium: getRegularStyle( color: ColorManager.darkGrey, fontSize:   14),
      // titleMedium: getMediumStyle( color: ColorManager.lightGrey, fontSize:   14),
      // bodyLarge: getRegularStyle( color: ColorManager.grey1 ),
      // bodySmall: getRegularStyle( color: ColorManager.grey )
  ),



  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(

    // content padding
      contentPadding: const EdgeInsets.all(8),

      // // hint style
      // hintStyle:
      // getRegularStyle(color: ColorManager.grey, fontSize:   14),
      //
      // // label style
      // labelStyle:
      // getMediumStyle(color: ColorManager.grey, fontSize:   14),
      //
      // // error style
      // errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.grey, width:  1),
          borderRadius: const BorderRadius.all(Radius.circular( 8))),

      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.primary, width:  1),
          borderRadius: const BorderRadius.all(Radius.circular( 8))),

      // error border style
      errorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.error, width:  1),
          borderRadius: const BorderRadius.all(Radius.circular( 8))),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.primary, width:  1),
          borderRadius: const BorderRadius.all(Radius.circular( 8)))),

);
