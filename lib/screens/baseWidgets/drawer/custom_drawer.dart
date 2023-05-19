import 'dart:ui';


import 'package:detict_age/screens/about/view.dart';
import 'package:detict_age/screens/language/view.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../Home/edit_profile.dart';
import 'bottom_user_info.dart';
import 'custom_list_tile.dart';
import 'header.dart';

class CustomDrawer extends StatefulWidget {
   CustomDrawer({Key? key, required this.username, required this.currentIndex }) : super(key: key);
   String username ;
   int currentIndex;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
            color: widget.currentIndex == 0 ?Colors.red: widget.currentIndex == 1 ?Colors.deepPurple:widget.currentIndex== 2 ?Colors.blue:Colors.purpleAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.grey,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.home_outlined,
                title: 'home'.tr(),
                infoCount: 0,
                onTab:(){
                  Navigator.pop(context);
                } ,

              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.language_outlined,
                title: 'language'.tr(),
                infoCount: 0,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const LanguageScreen()));
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.info_outline,
                title: 'about'.tr(),
                infoCount: 0,
                onTab:(){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AboutScreen()));
                } ,
              ),
              // CustomListTile(
              //   isCollapsed: _isCollapsed,
              //   icon: Icons.pin_drop,
              //   title: 'Destinations',
              //   infoCount: 0,
              //   doHaveMoreOptions: Icons.arrow_forward_ios,
              // ),

              // CustomListTile(
              //   isCollapsed: _isCollapsed,
              //   icon: Icons.cloud,
              //   title: 'Weather',
              //   infoCount: 0,
              //   doHaveMoreOptions: Icons.arrow_forward_ios,
              // ),
              // CustomListTile(
              //   isCollapsed: _isCollapsed,
              //   icon: Icons.airplane_ticket,
              //   title: 'Flights',
              //   infoCount: 0,
              //   doHaveMoreOptions: Icons.arrow_forward_ios,
              // ),
              const Divider(color: Colors.grey),
              const Spacer(),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.notifications,
                title: 'Notifications'.tr(),
                infoCount: 2,
                onTab: (){},
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.edit,
                title: 'Edit Profile'.tr(),
                infoCount: 0,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  EditProfileScreen()));

                },
              ),
              const SizedBox(height: 10),
              BottomUserInfo(isCollapsed: _isCollapsed,username: widget.username,currentIndex: widget.currentIndex ),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
