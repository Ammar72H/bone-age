import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/assets_manager.dart';

class RoundedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final int  currentBottomIndex;

  const RoundedAppBar({Key? key, required this.height,required this.currentBottomIndex}) : super(key: key);

  @override
  _RoundedAppBarState createState() => _RoundedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _RoundedAppBarState extends State<RoundedAppBar> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _isExpanded ? widget.height * 2 : widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color:      widget.currentBottomIndex == 0 ?Colors.red:   widget.currentBottomIndex == 1 ?Colors.deepPurple:  widget.currentBottomIndex == 2 ?Colors.blue:Colors.purpleAccent,

      ),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor:widget.currentBottomIndex == 0 ?Colors.red:   widget.currentBottomIndex == 1 ?Colors.deepPurple:  widget.currentBottomIndex == 2 ?Colors.blue:Colors.purpleAccent,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        ),
        elevation: 0,
        backgroundColor:widget.currentBottomIndex == 0 ?Colors.red:   widget.currentBottomIndex == 1 ?Colors.deepPurple:  widget.currentBottomIndex == 2 ?Colors.blue:Colors.purpleAccent,

        title: Row(
      children: [
      Image.asset(ImageAssets.splashLogo,height: 35, width: 35,color: Colors.white),
      Text(  widget.currentBottomIndex == 0 ?"   X-Ray Age Detector   ":   widget.currentBottomIndex == 1 ?"   Exact Age   ":  widget.currentBottomIndex == 2 ?"   My Reports   ":"   Profile   ",),
      ],
    ),titleTextStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),
    centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(
        //     _isExpanded ? Icons.arrow_back : Icons.menu,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       _isExpanded = !_isExpanded;
        //     });
        //   },
        // ),

      ),
    );
  }
}