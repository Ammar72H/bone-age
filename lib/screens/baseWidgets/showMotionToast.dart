
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

showSuccessToast(context , { required String title , required String description}){
  MotionToast.success(
      title:   Text(title),
      position:  MotionToastPosition.bottom,
      //layoutOrientation: ORIENTATION.rtl,
      description:   Text(description),
      height: 80,
      width:  300,
  ).show(context);
}

showErrorToast(context , { required String title , required String description}){
  MotionToast.error(
      title:  Text(title),
      position:  MotionToastPosition.bottom,
      //layoutOrientation: ORIENTATION.rtl,
      description:  Text(description)
  ).show(context);
}