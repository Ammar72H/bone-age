
import 'package:detict_age/screens/sign_in/controller.dart';
import 'package:detict_age/screens/sign_in/states.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:lottie/lottie.dart';

import '../../helper/inputValidator.dart';
import '../../utils/assets_manager.dart';
import '../../utils/color_manager.dart';
import '../baseWidgets/showMotionToast.dart';
import '../register/view.dart';



class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

        create: (context) => SignInController(),
        child: BlocConsumer<SignInController, SignInStates>(
            listener: (context, state) {
              if(state is LoginSuccessState ){
                showSuccessToast(context, title: " Success Login  ", description: '',);

              } else if(state is LoginFailState){
                showErrorToast(context, title: "  Error in Login  ", description: 'please enter correct information',);
              }
            },
            builder: (context, state) {
              final controller =
                  SignInController.get(context);
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarColor: Colors.blue,
              ));
                return Scaffold(
                body: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(0,147,255, 1),
                          Color.fromRGBO(	142, 54, 153, 1),
                        ],
                      ),
                    ),
                    //color: F3E9DD,
                    child: BlocConsumer<SignInController, SignInStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          final controller = SignInController.get(context);
                          return SingleChildScrollView(
                            child: Form(
                              key: controller.formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DropdownButton(
                                      onChanged: (v) => setState(() {
                                        translator.setNewLanguage(
                                          context,
                                          newLanguage: v.toString(),
                                          remember: true,
                                          restart: true,
                                        );
                                      }),
                                      value: translator.currentLanguage , // change this line with your way to get current locale to select it as default in dropdown
                                      items: [
                                        DropdownMenuItem(
                                            child: Text( 'English',), value: 'en'
                                        ),
                                        DropdownMenuItem(

                                            child: Text( 'العربية',), value: 'ar',
                                        ),
                                      ],
                                    ),
                                    // Center(
                                    //   child: SizedBox(
                                    //     height: 150,
                                    //     child: Lottie.asset(
                                    //       'assets/json/face.json',
                                    //       repeat: true,
                                    //       animate: true,
                                    //     ),
                                    //   ),
                                    // ),
                                    Center(
                                      child: SizedBox(
                                        height: 150,
                                        child:Image.asset(ImageAssets.splashLogo,color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(50.0),
                                    //   child: Image.asset(
                                    //     ImageAssets.splashLogo,
                                    //     fit: BoxFit.contain,
                                    //   ),
                                    // ),
                                    const SizedBox(height: 10,),
                                    Center(
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText('Welcome!'.tr(),
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                //fontStyle: FontStyle.italic,
                                                fontFamily: 'Times New Roman',
                                                fontWeight: FontWeight.w600,
                                              ),
                                              speed: const Duration(
                                                milliseconds: 450,
                                              )),
                                        ],
                                        onTap: () {
                                          debugPrint("Welcome back!");
                                        },
                                        isRepeatingAnimation: true,
                                        totalRepeatCount: 2,
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      controller: controller.signInEmailController,
                                      validator: InputValidator.isUserNameValid,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(color: Colors.white),
                                        label: Text("User Name".tr(),style: TextStyle(color: Colors.white)),
                                        hintText: "User Name".tr(),
                                        prefixIcon: Icon(Icons.person,color: Color(0xFFffffff),
                                      ),
                                    ),),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      controller: controller.signInPassController,
                                      obscureText: true,
                                      style: TextStyle(color: Colors.white),

                                      validator: controller.validateMyInput,
                                      decoration: InputDecoration(
                                        label: Text("password".tr(),style: TextStyle(color: Colors.white)),
                                        hintText: "password".tr(),
                                        prefixIcon: Icon(Icons.lock,color: Color(0xFFffffff),
                                        ),
                                      ),),
                                    SizedBox(height: 30,),

                                    // state is LoginLoadingState
                                    // ? Dialog(
                                    //   child: Container(
                                    //     height: 300,
                                    //     child: Column(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         FlutterLogo(size: 150,),
                                    //         Text("This is a Custom Dialog",style:TextStyle(fontSize: 20),),
                                    //         ElevatedButton(
                                    //
                                    //             onPressed: (){
                                    //               Navigator.of(context).pop();
                                    //             }, child: Text("Close"))
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ):Container(),
                                    state is LoginLoadingState
                                        ? Center(
                                          child: CircularProgressIndicator(
                                      color: ColorManager.primary,
                                    ),
                                        )
                                        : Container(
                                      //height: 50,
                                      width: double.infinity,
                                      child:  ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ColorManager.primary,
                                            //onPrimary: Colors.deepOrange,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(18)),
                                            fixedSize: const Size.fromHeight(50),
                                          ),

                                          onPressed: () {

                                            if (controller.formKey.currentState!
                                                .validate()) {
                                              controller.login(context);
                                            }
                                          },
                                          child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("login".tr(),style: TextStyle(fontSize: 26,color: Colors.white),),
                                              )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Don't have an account?".tr(),style: TextStyle(color: Colors.white70),),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RegisterScreen(),),(route) => false);
                                            //navigateToAndR(context, RegisterScreen());
                                          },
                                          child:  Text(
                                            "Sign Up".tr(),
                                            style: TextStyle(
                                              color: Color(0xffffffff),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              );
            }));
  }
}
