import 'package:detict_age/screens/register/controller.dart';
import 'package:detict_age/screens/register/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../helper/inputValidator.dart';
import '../../utils/color_manager.dart';
import '../baseWidgets/showMotionToast.dart';
import '../sign_in/view.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterController(),
      child: BlocConsumer<RegisterController, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showSuccessToast(
              context,
              title: "You are Register in successfully",
              description: '',
            );
          } else if (state is RegisterFailState) {}
          if (state is RegisterFailState) {
            showErrorToast(context,
                title: "Error",
                description:
                    "Please make sure that you enter your correct information");
          } else if (state is RegisterPasswordsNotMatchedState) {
            showErrorToast(context,
                title: "Error", description: "Password does not match");
          } else if (state is RegisterImageNotPickedState) {
            showErrorToast(context,
                title: "Error", description: "Please select your photo");
          }
        },
        builder: (context, state) {
          final controller =
              RegisterController.get(context); // get object from cubit
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
                      Color.fromRGBO(0, 147, 255, 1),
                      Color.fromRGBO(142, 54, 153, 1),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      // Container(
                      //   height: 150,
                      //   child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
                      // ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0,
                            translator.currentLanguage == 'en' ? 100 : 85,
                            0,
                            10),
                        alignment: Alignment.center,
                        child: Form(
                          key: controller.formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Register".tr(),
                                    style: TextStyle(
                                        color: Color(0xFFffffff),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Enter You Personal Information".tr(),
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: InkWell(
                                    child: controller.image == null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/images/upload.png",
                                              height: 80,
                                              width: 80,
                                            ),
                                        )
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                          child: Image.file(
                                              controller.image!,
                                              height: 80,
                                              width: 80,
                                            ),
                                        ),
                                    onTap: () {
                                      controller.pickImage();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller.registerNameController,
                                  validator: InputValidator.isNameValid,
                                  style: TextStyle(color: Colors.white),

                                  decoration: InputDecoration(
                                    label: Text(
                                      "User Name".tr(),
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    hintText: "User Name".tr(),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0xFFffffff),
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 15,
                                ),

                                Row(
                                  children: <Widget>[
                                    Expanded(child: TextFormField(
                                      controller: controller.registerFirstNameController,
                                      validator: InputValidator.isNameValid,
                                      style: TextStyle(color: Colors.white),

                                      decoration: InputDecoration(
                                        label: Text(
                                          "First Name".tr(),
                                          style: TextStyle(color: Colors.white70),
                                        ),
                                        hintText: "First Name".tr(),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Color(0xFFffffff),
                                        ),
                                      ),
                                    ),),
                                    SizedBox(width: 10),
                                    Expanded(child: TextFormField(
                                      controller: controller.registerLastNameController,
                                      validator: InputValidator.isNameValid,
                                      style: TextStyle(color: Colors.white),

                                      decoration: InputDecoration(
                                        label: Text(
                                          "Last Name".tr(),
                                          style: TextStyle(color: Colors.white70),
                                        ),
                                        hintText: "Last Name".tr(),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Color(0xFFffffff),
                                        ),
                                      ),
                                    ),),

                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller:
                                      controller.registerEmailController,
                                  validator: InputValidator.isEmailValid,
                                  style: TextStyle(color: Colors.white),

                                  decoration: InputDecoration(
                                    label: Text(
                                      "email".tr(),
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    hintText: "email".tr(),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(0xFFffffff),
                                    ),
                                  ),
                                ),
const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller:
                                      controller.registerPhoneController,
                                  validator: InputValidator.isPhoneValid,
                                  style: TextStyle(color: Colors.white),

                                  decoration: InputDecoration(
                                    label: Text(
                                      "phone".tr(),
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    hintText: "phone".tr(),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Color(0xFFffffff),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: controller.registerPassController,
                                  validator: controller.validateMyInput,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    label: Text(
                                      "password".tr(),
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    hintText: "password".tr(),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color(0xFFffffff),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller:
                                      controller.registerPass2Controller,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  validator: controller.validateMyInput,
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Confirm Password".tr(),
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    hintText: "Confirm Password".tr(),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color(0xFFffffff),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 25,
                                ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: ListTile(
                                //         title: const Text('Patient',style: TextStyle(color: Color(0xFF1A132F))),
                                //         leading: Radio(
                                //           activeColor: Color(0xFF1A132F),
                                //           value: "patient/",
                                //           groupValue: controller.chooseUser,
                                //           onChanged: ( value) async{
                                //             await controller.setUser(value as String);
                                //
                                //           },
                                //         ),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: ListTile(
                                //         title: const Text('Doctor',style: TextStyle(color: Color(0xFF1A132F))),
                                //         leading: Radio(
                                //           activeColor: Color(0xFF1A132F),
                                //           value: "doctor/",
                                //           groupValue: controller.chooseUser,
                                //           onChanged: ( value) async{
                                //             await controller.setUser(value as String);
                                //             //controller.chooseUser = value as String;
                                //
                                //           },
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Container(
                                  //height: 50,
                                  width: double.infinity,
                                  child: state is RegisterLoadingState
                                      ? Center(
                                        child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                      )
                                      :  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorManager.primary,
                                        //onPrimary: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        fixedSize: const Size.fromHeight(50),
                                      ),
                                      onPressed: () {
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          controller.register(context);
                                        }
                                      },
                                      child:Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Register".tr(),
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                            )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "have an account?".tr(),
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen(),
                                            ),
                                            (route) => false);
                                        //navigateToAndR(context, const SignInScreen());
                                      },
                                      child: Text(
                                        "Sign In".tr(),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
