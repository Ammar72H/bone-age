
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:detict_age/screens/Home/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:lottie/lottie.dart';

import '../baseWidgets/drawer/custom_drawer.dart';
import '../baseWidgets/rounded_appbar.dart';
import 'controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController(),
      child: BlocConsumer<HomeController, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = HomeController.get(
              context); // get object from cubit
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ));
          return Scaffold(
            appBar: RoundedAppBar(height: 80,currentBottomIndex: controller.currentBottomIndex),

            // appBar: AppBar(elevation: 0,title: Row(
            //   children: [
            //     Image.asset(ImageAssets.splashLogo,height: 22, width: 22),
            //      Text(controller.currentBottomIndex == 0 ?"   Age Detector   ": controller.currentBottomIndex == 1 ?"   Exact Age   ":controller.currentBottomIndex == 2 ?"   My Reports   ":"   Profile   ",),
            //   ],
            // ),titleTextStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),
            //   centerTitle: true,backgroundColor: controller.currentBottomIndex == 0 ?Colors.red: controller.currentBottomIndex == 1 ?Colors.deepPurple:controller.currentBottomIndex == 2 ?Colors.blue:Colors.purpleAccent, ),


            drawer: CustomDrawer(username: "username",currentIndex:controller.currentBottomIndex  ),
            body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: controller.currentPage[controller.currentBottomIndex]
            ),
            bottomNavigationBar:  BottomNavyBar(
              selectedIndex: controller.currentBottomIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                controller.ChangeBottomNavBarIndex(index);
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              }),
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'.tr()),
                  activeColor: Colors.red,
                ),

                BottomNavyBarItem(
                  icon: Icon(Icons.perm_identity),
                  title: Text('Exact Age'.tr()),
                  activeColor: Colors.deepPurple,
                ),

                BottomNavyBarItem(
                    icon: Icon(Icons.receipt_long_outlined),
                    title: Text('My Reports'.tr()),
                    activeColor: Colors.blue
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Profile'.tr()),
                    activeColor: Colors.purpleAccent
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
