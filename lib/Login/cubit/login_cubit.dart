import 'package:dio/dio.dart';
import 'package:doctor/Home/main_screen.dart';
import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/modelLogin.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit getObject(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  void postLogin(
      {required String Email,
      required String PassWord,
      required BuildContext context}) {
    print(Email + PassWord);
    emit(LoginLoading());
    FormData formData = FormData.fromMap({
      "email": Email,
      "password": PassWord,
    });
    DioHelper.postData("login", data: formData).then((value) {
      print("login Sccfully");
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      CachShpreafapp.sevedata(
          key: "tokenProfile", value: loginModel!.data!.token!);
      print(CachShpreafapp.getdata(key: "tokenProfile").toString() +
          "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
      CachShpreafapp.sevedata(
          key: "UserID", value: loginModel!.data!.user!.id!);
      CachShpreafapp.sevedata(
          key: "UserIDD", value: loginModel!.data!.user!.doctor!.id!);
      CachShpreafapp.sevedata(
          key: "FName", value: loginModel!.data!.user!.doctor!.firstName!);
      CachShpreafapp.sevedata(
          key: "LName", value: loginModel!.data!.user!.doctor!.lastName!);
      CachShpreafapp.sevedata(
          key: "ImageProfile", value: loginModel!.data!.user!.doctor!.image!);
      // CachShpreafapp.sevedata(
      //     key: "ProfileID", value: loginModel!.data!.user!.profiles!.id!);
      // CachShpreafapp.sevedata(key: "boolfavoratie", value: false);
      print(CachShpreafapp.getdata(key: "tokenProfile").toString());

      // print(loginModel!.data!.user!.profiles.lName!.toString());

      if (loginModel!.status! && loginModel!.role == "SB") {
        Fluttertoast.showToast(
            msg: loginModel!.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => MainScreen(),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Please enter the doctor's information.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      chingLoading(false);
      emit(LoginSusccfuly());
    }).catchError((onError) {
      print(onError.toString());
      Fluttertoast.showToast(
          msg: loginModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      chingLoading(false);
      emit(LoginError());
    });
  }

  bool isload = false;
  void chingLoading(bool isloading) {
    this.isload = isloading;
    emit(LoginChangLoading());
  }

  bool isloadObserivice = true;
  void chingLoadingObserivice() {
    this.isloadObserivice = !this.isloadObserivice;
    emit(LoginChangLoading());
  }
}
