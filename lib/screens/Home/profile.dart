import 'package:detict_age/screens/Home/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../helper/cache_helper.dart';
import '../sign_in/view.dart';
import 'controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController()..getProfileDataModel(),
      child: BlocConsumer<HomeController, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = HomeController.get(
              context); // get object from cubit
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: CircleAvatar(
                    radius: 64,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                        "${controller.getProfileData?.profilePicture}",),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${controller.getProfileData?.firstName??"loading ..."}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4),
                    SizedBox(width: 10,),
                    Text('${controller.getProfileData?.lastName??""}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4),
                  ],
                ),
                const SizedBox(height: 10,),
                Text('${controller.getProfileData?.username??"loading"}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium),
                const SizedBox(height: 10,),
                Divider(),
                ListTile(title: Text("${controller.getProfileData?.email??"loading"}"),enabled: false,leading: Icon(color: Colors.purpleAccent,Icons.email_outlined),),
                ListTile(title: Text("${controller.getProfileData?.phone??"loading"}"),enabled: false,leading: Icon(color: Colors.purpleAccent,Icons.phone),),
                const SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: OutlinedButton.icon( style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                    //onPrimary: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    fixedSize: const Size.fromHeight(40),
                  ),icon: Icon(Icons.logout,color: Colors.white,),onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.purpleAccent,
                                title: Text("Log out".tr()),
                                titleTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                content: Text("Are you sure you want to log out?".tr(),style: TextStyle(color: Colors.white)),
                                contentTextStyle:
                                const TextStyle(color: Colors.black),
                                actions: [
                                  ElevatedButton(style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel".tr())),
                                  ElevatedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.purpleAccent,),
                                      onPressed: ()  {
                                        CacheHelper.removeToken().then((value){
                                          CacheHelper.removeInt(key: "user_id").then((value){
                                            CacheHelper.removeData(key: "username",).then((value) {
                                              CacheHelper.removeData(key: "photo",).then((value) {
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  SignInScreen()));

                                              });
                                            });


                                          } );
                                        });
                                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  SignInScreen()));
                                      },
                                      child: Text("Ok".tr())),
                                ],
                              );
                            });
                      }, label: Text("Log out".tr(),style: TextStyle(color: Colors.white,),))),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
