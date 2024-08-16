import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/profileDoctor/cubit/profile_cubit.dart';
import 'package:doctor/profileDoctor/model/editProfile.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit geyObject(context) => BlocProvider.of(context);
  UpdataModel? updataModel;
  ProfileCubit profileCubit = ProfileCubit();
  void postEditProfile(
      {File? selectedImage,
      // int? gender,
      required String name,
      required String lastName,

      // required String email,
      required String phone,
      // required String data,
      required String descreption,
      // required String gender,
      // required int experience,
      // required String specialties,
      required BuildContext context}) async {
    emit(EditProfileLoadingPost());
    List<int> fileBytes = await selectedImage!.readAsBytes();
    print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP" +
        selectedImage.toString() +
        lastName.toString() +
        name.toString() +
        // .toString() +
        phone.toString() +
        // data.toString() +
        descreption.toString() +
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
    FormData formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(fileBytes, filename: 'image.jpg'),
      "firstName": name,
      "lastName": lastName,
      "mobile": phone,
      "description": descreption,
      "type": "Health",
      // "birth":data,
      // "gender": "Health",
      // "experience": "Health",
      // "specialties": "Health",
    });
 
    DioHelper.postData("editDoctor/${CachShpreafapp.getdata(key: "UserIDD")}",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {

      updataModel = UpdataModel.fromJson(value.data);


      if (updataModel!.status!) {
        // Navigator.pushReplacement<void, void>(
        //   context,
        //   MaterialPageRoute<void>(
        //     builder: (BuildContext context) => MainScreen(),
        //   ),
        // );
      }
      Fluttertoast.showToast(
          msg: updataModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(EditProfileSueccufilyPost());
      // getprofile();
      profileCubit.getprofile();
      // getdataEidtProfile();
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: updataModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(EditProfileErrorPost());
      print(onError.toString());
    });
  }

  void getprofile() {
    emit(EditProfileLoadingGet());

    DioHelper.getDataProfile(
            "profile", CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString());
      // userResponse = UserResponse.fromJson(value.data);
      // print(userResponse!.status.toString());
      // print(userResponse!.data.image.toString());
      emit(EditProfileSueccufulyGet());
    }).catchError((onError) {
      print(onError.toString());
      emit(EditProfileErrorGet());
    });
  }
  // void getdataEidtProfile() {
  //   emit(EditProfileLoadingGet());
  //   DioHelper.getData("getEiditProfile").then((value) {
  //     Fluttertoast.showToast(
  //         msg: "ok get",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     emit(EditProfileSueccufulyGet());
  //   }).catchError((onError) {
  //     print(onError.toString());
  //     Fluttertoast.showToast(
  //         msg: onError.toString(),
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 4,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     emit(EditProfileErrorGet());
  //   });
  // }
}
