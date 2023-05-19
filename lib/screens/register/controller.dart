import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:detict_age/screens/register/states.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../helper/cache_helper.dart';
import '../../helper/dio_helper.dart';
import '../Home/view.dart';
import 'model.dart';

class RegisterController extends Cubit<RegisterStates> {
  RegisterController() : super(RegisterInitialState());

  static RegisterController get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerFirstNameController = TextEditingController();
  final registerLastNameController = TextEditingController();
  final registerPassController = TextEditingController();
  final registerPass2Controller = TextEditingController();
  final registerPhoneController = TextEditingController();



  @override
  Future<void> close() {
    registerNameController.clear();
    registerEmailController.clear();
    registerFirstNameController.clear();
    registerLastNameController.clear();
    registerPassController.clear();
    registerPhoneController.clear();
    return super.close();
  }


// get image
  File? image ;
  pickImage({source = ImageSource.gallery}) async{
    var pickedImage = await ImagePicker.platform.pickImage(source: source);
    if(pickedImage != null){
      image = File(pickedImage.path);
      emit(PickImageSuccessState());
    }else{
      //toast
      // print no image selected
    }
  }

  void register(context)
  async{
    emit(RegisterLoadingState());
    if( image != null){
      print("pick image success");
      if(formKey.currentState!.validate()){
        print("validate success");

        String fileName = image!.path.split("/").last;   // name of image
        FormData formData = FormData.fromMap(
            {
              "username": registerNameController.text.toString().trim(),
              "email": registerEmailController.text.toString().trim(),
              "first_name": registerFirstNameController.text.toString().trim(),
              "last_name":  registerLastNameController.text.toString().trim(),
              "profile_picture": await MultipartFile.fromFile(image!.path,filename: fileName),
              "phone":registerPhoneController.text.toString().trim(),
              "password":registerPassController.text.toString().trim(),



            }
        );

        if(registerPassController.text.trim() == registerPass2Controller.text.trim()){

          DioHelper.postFormData(endPoint: "auth/users/",formData: formData).then((value)
          {
            var registerModel = RegisterModel.fromJson(value.data);
            try{
              if(value.data["token"]!= null ){
                //var registerModel = RegisterModel.fromJson(value.data);
                CacheHelper.writeToken(value: registerModel.token??"").then((value) {
                  CacheHelper.writeInt(key:"user_id",value: registerModel.id).then((value) {
                    CacheHelper.saveData(key: "username", value: registerModel.username);
                    CacheHelper.saveData(key: "photo", value: registerModel.profilePicture);
                    print("value is ${value}");
                    if(value && registerModel.token != null ){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  HomeScreen(),), (route) => false);
                      emit(RegisterSuccessState());
                    }else{
                      emit(RegisterFailState());
                    }
                  });

                });
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()),);
                // showSuccessToast(context ,tilte: "Success" , description: "You can login now");
               // emit(RegisterSuccessState());
               // print("Register Success State");
                // CacheHelper.saveData(key: "user_id", value: registerModel.userId.toString()).then((value) {
                //
                // });
              }
            }catch(e){
              print("llk");
              print("${e}");
            }


          }
          ).catchError((error){
            emit(RegisterFailState());
            print('error is ${error.response} ///////////        error');});
        };
      }else{
        emit(RegisterPasswordsNotMatchedState());
        print("passwords not matched");
      }


    }
    else{
      emit(RegisterImageNotPickedState());
      print("please select image");
    }

  }


  String? validateMyInput(String? value) {
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex =  RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Enter Number Contains upper&lower letters and numbers';
    else
      return null;
  }
}
