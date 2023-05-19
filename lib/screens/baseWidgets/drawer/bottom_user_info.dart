import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../helper/cache_helper.dart';
import '../../sign_in/view.dart';

class BottomUserInfo extends StatelessWidget {
  final bool isCollapsed;

   BottomUserInfo({
    Key? key,
    required this.isCollapsed,
    required this.username,
    required this.currentIndex,
  }) : super(key: key);
  String username;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCollapsed ? 70 : 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isCollapsed
          ? Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CacheHelper.getData(key: "photo")!= "" ?Image.network(CacheHelper.getData(key: "photo").startsWith("https:")?"${CacheHelper.getData(key: "photo")}":"https://boneage.pythonanywhere.com${CacheHelper.getData(key: "photo")}"):Icon(Icons.person),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "${CacheHelper.getData(key: "username")}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'MEMBER'.tr(),
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                               backgroundColor:  currentIndex == 0 ?Colors.red: currentIndex == 1 ?Colors.deepPurple:currentIndex== 2 ?Colors.blue:Colors.purpleAccent,
                                  title: Text("Log out".tr()),
                                  titleTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  content: Text("Are you sure you want to log out?".tr()),
                                  contentTextStyle:
                                  const TextStyle(color: Colors.white),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel".tr()),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:   currentIndex == 0 ?Colors.red: currentIndex == 1 ?Colors.deepPurple:currentIndex== 2 ?Colors.blue:Colors.purpleAccent, // Background color
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: ()  {
                                          CacheHelper.removeToken().then((value){
                                            CacheHelper.removeInt(key: "user_id").then((value){
                                              CacheHelper.removeData(key: "username",).then((value) {
                                                CacheHelper.removeData(key: "photo",).then((value) {
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  SignInScreen()));

                                                });
                                              });


                                            } );
                                          });                                        },
                                        child: Text("Ok".tr()),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:   currentIndex == 0 ?Colors.red: currentIndex == 1 ?Colors.deepPurple:currentIndex== 2 ?Colors.blue:Colors.purpleAccent, // Background color
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CacheHelper.getData(key: "photo")!= "" ?Image.network(CacheHelper.getData(key: "photo").startsWith("https:")?"${CacheHelper.getData(key: "photo")}":"https://boneage.pythonanywhere.com${CacheHelper.getData(key: "photo")}"):Icon(Icons.person),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:  currentIndex == 0 ?Colors.red: currentIndex == 1 ?Colors.deepPurple:currentIndex== 2 ?Colors.blue:Colors.purpleAccent,
                              title: Text("Log out".tr()),
                              titleTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              content: Text("Are you sure you want to log out?".tr()),
                              contentTextStyle:
                              const TextStyle(color: Colors.white),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel".tr()),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:   currentIndex == 0 ?Colors.red: currentIndex == 1 ?Colors.deepPurple:currentIndex== 2 ?Colors.blue:Colors.purpleAccent, // Background color
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: ()  {
                                      CacheHelper.removeToken().then((value){
                                        CacheHelper.removeInt(key: "user_id").then((value){
                                          CacheHelper.removeData(key: "username",).then((value) {
                                            CacheHelper.removeData(key: "photo",).then((value) {
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  SignInScreen()));

                                            });
                                          });


                                        } );
                                      });                                    },

                                    child: Text("Ok".tr()),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:   currentIndex == 0 ?Colors.red: currentIndex == 1 ?Colors.deepPurple:currentIndex== 2 ?Colors.blue:Colors.purpleAccent, // Background color
                                    ),
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
