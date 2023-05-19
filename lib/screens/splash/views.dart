import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import '../../helper/cache_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/assets_manager.dart';
import '../../utils/color_manager.dart';
import '../onBoarding/view.dart';
import '../sign_in/view.dart';
import 'package:page_transition/page_transition.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>  CacheHelper.readFirstTime(key:AppConstants.isFirstTime ) == true ? const OnBoardingScreen():  SignInScreen(),
          ),
              (route) => false);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return Scaffold(
        backgroundColor:  ColorManager.white,
        body: Container(

          child: AnimatedSplashScreen(
            splash: Center(
              child: Container(

                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.splashLogo,height: 250,
                      // repeat: false,
                      // animate: true,height: 250
                    ),
                    const SizedBox(height: 10,),

                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('X-Ray Age Detector',
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              //fontStyle: FontStyle.italic,
                              fontFamily: 'Bobbers',
                              fontWeight: FontWeight.w500,
                            ),
                            speed: const Duration(
                              milliseconds: 200,
                            )),
                      ],
                      onTap: () {
                        debugPrint("splash !");
                      },
                      isRepeatingAnimation: true,
                      totalRepeatCount: 2,
                    ),
                  ],
                ),
              ),
            ),


            //nextScreen: HomeScreen(),
            splashTransition: SplashTransition.sizeTransition,
            backgroundColor: Colors.white,
            splashIconSize: 400,
            duration: 5000,
            pageTransitionType: PageTransitionType.leftToRight,
            nextScreen: CacheHelper.readFirstTime(key:AppConstants.isFirstTime ) == true ? const OnBoardingScreen():  SignInScreen(),

          ),
        ),

        // body: SafeArea(
        //   child: Container(
        //     height: double.infinity,
        //     width: double.infinity,
        //     // decoration: const BoxDecoration(
        //     //   image: DecorationImage(
        //     //     image: AssetImage(ImageAssets.splashLogo,),
        //     //     //fit: BoxFit.fitWidth,
        //     //   ),
        //     // ),
        //     child: Column(
        //        mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Image.asset(ImageAssets.splashLogo,height: 120,width: 120,),
        //         const SizedBox(height: 30),
        //         SpinKitWanderingCubes(
        //           color: ColorManager.primary,
        //           size: 30.0,
        //         ),
        //       ],
        //     ),
        //
        //   ),
        // )
    );
  }
}
