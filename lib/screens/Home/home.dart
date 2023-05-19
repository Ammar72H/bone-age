import 'package:detict_age/screens/Home/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:lottie/lottie.dart';

import '../../utils/assets_manager.dart';
import 'controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController(),
      child: BlocConsumer<HomeController, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = HomeController.get(
              context); // get object from cubit
          return SafeArea(
            child: Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state is UploadAnimalImageLoadingState
                      ? Lottie.asset('assets/json/loading.json',)
                      : InkWell(
                    child: controller.image == null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                      ImageAssets.upload,
                            height: 200,

                    ),
                        )
                        : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            height: 300,
                            controller.image!,

                          )),
                        ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                //mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.cancel_outlined),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  ListTile(
                                    title: Text("Pick from gallery"),
                                    leading: Icon(Icons.image_outlined),
                                    onTap: (){
                                      controller.pickImage(context,source: ImageSource.gallery);
                                    },
                                  ),
                                  ListTile(
                                    title: Text("Pick from camera"),
                                    leading: Icon(Icons.photo_camera_outlined),
                                    onTap: (){
                                      controller.pickImage(context,source: ImageSource.camera);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );

                    },
                  ),
                  SizedBox(height: 20,),
                  Text("Upload Image".tr(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500)),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("description".tr(),
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,color: Colors.grey),          textAlign: TextAlign.center,),
                    ),

                  SizedBox(height: 40,),
                  Container(
                    padding: EdgeInsetsDirectional.all(20),
                    child:state is UploadAnimalImageLoadingState ? Center(child: CircularProgressIndicator(
                      color: Colors.red,
                    )):ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          //onPrimary: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: const Size.fromHeight(63),
                        ),
                        onPressed: () {

                          controller.uploadXRayImage(context);
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SignInScreen(),
                          //     ),
                          //         (route) => false);
                          // // save shardpref file >> false
                          // CacheHelper.writeFirstTime(
                          //     key: "isFirstTime", value: false);

                        },
                        child:  Text(
                          "    Check Your Result    ".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            // fontStyle: FontStyle.italic
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
