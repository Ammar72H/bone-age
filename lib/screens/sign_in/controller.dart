import 'package:detict_age/screens/sign_in/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/cache_helper.dart';
import '../../helper/dio_helper.dart';
import '../Home/view.dart';
import 'model.dart';


class SignInController extends Cubit<SignInStates> {
  SignInController() : super(SignInInitialState());

  static SignInController get(context) => BlocProvider.of(context);
  final signInEmailController = TextEditingController();
  final signInPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // defaultTextFormField
  bool showPass = true;
  ChangeSufixIcon() {
    // print('try emit');
    showPass = !showPass ;
    emit(LoginChangeSufixIconState());
  }
  @override
  Future<void> close() {
    signInEmailController.clear();
    signInPassController.clear();
    return super.close();
  }

  // late LoginModel loginModel ;
  // Api
  login(context) {
    emit(LoginLoadingState());
    DioHelper.postData(endPoint: 'auth/login/',data: {
      "username": signInEmailController.text.toString().trim(),
      "password":signInPassController.text.toString().trim(),
    } ).then((value)  {
       print("login value is ${value.data}");
      var loginModel = LoginModel.fromJson(value.data);
      CacheHelper.writeToken(value: loginModel.token??"").then((value) {
        CacheHelper.writeInt(key:"user_id",value: loginModel.user_id).then((value) {
          CacheHelper.saveData(key: "username", value: loginModel.username);
          CacheHelper.saveData(key: "photo", value: loginModel.photo);
          print("value is ${value}");
          if(value && loginModel.token != null ){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  HomeScreen(),), (route) => false);
            emit(LoginSuccessState(loginModel));
          }else{
            emit(LoginFailState());
          }
        });

      });
      // print(loginModel.data.token);



    }).catchError((error){
      emit(LoginFailState());
      print('error is ${error.toString()}');});
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
