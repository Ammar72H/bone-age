
import 'package:detict_age/helper/cache_helper.dart';
import 'package:detict_age/screens/Home/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../helper/inputValidator.dart';
import 'controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) =>HomeController()..getProfileDataModel(),
  child: BlocConsumer<HomeController, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = HomeController.get(context); // get object from cubit
        // controller.user == null ? controller.getUserData():null;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_rounded,color: Colors.white),
            //   onPressed: (){
            //     //controller.getProfileDataModel();
            //     //controller.image = null ;
            //     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) =>  HomeScreen(
            //     // )), (route) => false);
            //     // Navigator.pop(context);
            //   },
            // ),
            title: Text("Edit Profile"),

          ),
            //controller.user
          body:  false ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(

                      height: 200,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child:controller.profileImage == null ?  CircleAvatar(
                              radius: 60.0,
                              backgroundImage:  NetworkImage(
                                "${controller.getProfileData?.profilePicture}",),
                            ): CircleAvatar(
                              radius: 60.0,
                              backgroundImage:  FileImage(controller.profileImage!),
                            ),
                          ) ,
                          CircleAvatar(radius: 16 ,child: IconButton(onPressed: (){
                            controller.pickProfileImage(context);
                          }, icon: Icon(Icons.camera_alt_outlined,size: 16,))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controller.editUserNameController,
                    validator: InputValidator.isNameValid,
                    decoration: InputDecoration(
                      label: Text(
                        "User Name".tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      hintText: "User Name".tr(),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(child: TextFormField(
                        
                        controller: controller.editFirstNameController,
                        validator: InputValidator.isNameValid,
                        decoration: InputDecoration(
                          label: Text(
                            "First Name".tr(),
                            style: TextStyle(color: Colors.grey),
                          ),
                          hintText: "First Name".tr(),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                      ),),
                      SizedBox(width: 10),
                      Expanded(child: TextFormField(
                        controller: controller.editLastNameController,
                        validator: InputValidator.isNameValid,
                        decoration: InputDecoration(
                          label: Text(
                            "Last Name".tr(),
                            style: TextStyle(color: Colors.grey),
                          ),
                          hintText: "Last Name".tr(),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
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
                    controller.editEmailController,
                    validator: InputValidator.isEmailValid,
                    decoration: InputDecoration(
                      label: Text(
                        "email".tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      hintText: "email".tr(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller:
                    controller.editPhoneController,
                    validator: InputValidator.isPhoneValid,
                    decoration: InputDecoration(
                      label: Text(
                        "phone".tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      hintText: "phone".tr(),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 15,
                  // ),
                  // TextFormField(
                  //   controller: controller.editPasswordNameController,
                  //   validator: InputValidator.isPasswordValid,
                  //   decoration: InputDecoration(
                  //     label: Text(
                  //       "password".tr(),
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //     hintText: "password".tr(),
                  //     prefixIcon: Icon(
                  //       Icons.lock,
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: 20,
                  ),

                  state is UploadAnimalImageLoadingState ? Center(
          child: CircularProgressIndicator(
          color: Colors.red,
          )):Row(
                    children: [

                      Expanded(
                        child: OutlinedButton.icon( style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red,
                          //onPrimary: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          fixedSize: const Size.fromHeight(40),
                        ),icon: Icon(Icons.update_rounded,color: Colors.white,),
                            onPressed: (){
                              controller.updateProfileData(context);

                            }, label: Text("  Update  ",style: TextStyle(color: Colors.white,),)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
);
  }
}
