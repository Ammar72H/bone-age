import 'dart:io';
import 'package:detict_age/screens/Home/age_calc.dart';
import 'package:detict_age/screens/Home/profile.dart';
import 'package:detict_age/screens/Home/reasult_view.dart';
import 'package:detict_age/screens/Home/reports.dart';
import 'package:detict_age/screens/Home/reports_model.dart';
import 'package:detict_age/screens/Home/states.dart';
import 'package:bloc/bloc.dart';
import 'package:detict_age/screens/Home/user_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../helper/cache_helper.dart';
import '../../helper/dio_helper.dart';
import '../baseWidgets/showMotionToast.dart';
import 'home.dart';

class HomeController extends Cubit<HomeStates> {
  HomeController() : super(HomeInitialState());

  static HomeController get(context) => BlocProvider.of(context);




  int currentBottomIndex = 0;

  List currentPage = [
    Home(),
    AgeCalcScreen(),
    ReportsScreen(),
    ProfileScreen(),


  ];

  ChangeBottomNavBarIndex(index) {
    currentBottomIndex = index;

    emit(ChangeBottomNavBarIndexState());
  }


  // get image
  File? image;

  pickImage(context,{source = ImageSource.gallery}) async {
    var pickedImage = await ImagePicker.platform.pickImage(source: source);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      Navigator.pop(context);
      emit(PickImageSuccessState());
    } else {
      //toast
      // print no image selected
    }
  }

  void uploadXRayImage(context) async {
    emit(UploadAnimalImageLoadingState());
    if (image != null) {
      print("pick image success");
      print("validate success");
      String fileName = image!.path.split("/").last; // name of image
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image!.path, filename: fileName),
        "patient_name":"HTI",
      });

     await DioHelper.postFormData(
                 endPoint: "ai/xray/",      // todo : set dynamic username
         formData: formData,token:  "Token ${CacheHelper.readToken()}")
          .then((value) {
        print("resonse ${value}");
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReasultScreen(reasult: value.data["response"].toString()),));
        print("check reaslt  success");
        emit(UploadAnimalImageSuccessState());
      }).catchError((error) {
        emit(UploadAnimalImageFailState());
        print('error is ${error.toString()} ///////////        error');
      });
    } else {
      emit(UploadAnimalImageImageNotPickedState());
      showErrorToast(context, title: "  Error  ", description: 'please select image',);

      print("please select image");
    }
  }





  // get profile data
  UserModel? getProfileData ;
  getProfileDataModel(){
    emit(GetProfileLoadingModelData());
    DioHelper.getData(endPoint: 'auth/users/${CacheHelper.readInt(key: "user_id")}/',token: "Token ${CacheHelper.readToken()}").then((value) {
      getProfileData = UserModel.fromJson(value.data);
      CacheHelper.saveData(key: "username", value: getProfileData!.username);
      print("profile data");
      print(getProfileData?.id);

      emit(GetProfileSuccessModelData());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(GetProfileFailModelData());
    }
    );

  }





  // get reports data
  ReportsModel? getReportsData ;
  getReportsDataModel(){
    emit(GetReportsLoadingModelData());
    DioHelper.getData(endPoint: 'ai/xray/',token: "Token ${CacheHelper.readToken()}").then((value) {
      getReportsData = ReportsModel.fromJson(value.data);
      print("profile data");
      print(getReportsData?.results);

      emit(GetReportsSuccessModelData());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(GetReportsFailModelData());
    }
    );

  }








  // for edit profile screen

  final editUserNameController = TextEditingController(text: CacheHelper.getData(key: "username"));
  final editEmailController = TextEditingController();
  final editPhoneController = TextEditingController();
  final editFirstNameController = TextEditingController();
  final editLastNameController = TextEditingController();



  // get image
  File? profileImage;

  pickProfileImage(context,{source = ImageSource.gallery}) async {
    var pickedImage = await ImagePicker.platform.pickImage(source: source);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      //Navigator.pop(context);
      print(" image selected................");

      emit(PickProfileImageSuccessState());
    } else {
      //toast
      print("no image selected");
      // print no image selected
    }
  }
  // upload profile data

  // passValues()async{
  //   await getProfileDataModel();
  //     editUserNameController.text=getProfileData!.username;
  //     editEmailController.text=getProfileData!.email;
  //     editFirstNameController.text=getProfileData!.firstName;
  //     editLastNameController.text=getProfileData!.lastName;
  //     editPhoneController.text=getProfileData!.phone;
  //
  // }
  void updateProfileData(context) async {
    emit(UploadAnimalImageLoadingState());
    if (profileImage != null) {
      print("pick image success");
      print("validate success");
      String fileName = profileImage!.path.split("/").last; // name of image
      FormData formData = FormData.fromMap({
        "profile_picture": await MultipartFile.fromFile(profileImage!.path, filename: fileName),
        "username":   editUserNameController.text          .toString().trim(),
        "email":      editEmailController.text           .toString().trim(),
        "first_name": editFirstNameController.text        .toString().trim(),
        "last_name":  editLastNameController.text           .toString().trim(),
        "phone":      editPhoneController.text           .toString().trim(),
      });

      await DioHelper.putFormData(
          endPoint: "auth/users/${CacheHelper.readInt(key: "user_id").toString()}/",      // todo : set dynamic username
          formData: formData,token:  "Token ${CacheHelper.readToken()}")
          .then((value) {
        print("resonse ${value}");
        showSuccessToast(context, title: "  Success  ", description: 'Your Profile Updated',);

        getProfileDataModel();
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ReasultScreen(reasult: value.data["response"].toString()),));
        print("update  success ...................................................");
        emit(UploadAnimalImageSuccessState());
      }).catchError((error) {
        emit(UploadAnimalImageFailState());
        print('error is ${error} ///////////        error');
        print(error.response?.data);

      });
    } else {
      emit(UploadAnimalImageImageNotPickedState());
      showErrorToast(context, title: "  Error  ", description: 'please select image',);

      print("please select image");
    }
  }
















}
