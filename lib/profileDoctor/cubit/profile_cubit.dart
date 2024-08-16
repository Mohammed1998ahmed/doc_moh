import 'dart:async';

import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/SplashScreen/SplashScreen.dart';
import 'package:doctor/profileDoctor/model/LogoutModel.dart';
import 'package:doctor/profileDoctor/model/getProfileModel.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/modelProfile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit getObject(context) => BlocProvider.of(context);
  ProfileModel? profileModel;
  final userResponseController = StreamController<UserResponse>();

// في الكود الخاص بـ cubit
  Stream<UserResponse> get userResponseStream => userResponseController.stream;
  void getprofile() {
    emit(ProfileLoadingProfile());

    DioHelper.getDataProfile(
            "Doctor_MY_Profile", CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(CachShpreafapp.getdata(key: "tokenProfile").toString() +
          "11111111111111111111SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
      // print(value.data.toString());
      profileModel = ProfileModel.fromJson(value.data);
      // userResponseController.add(userResponse!);

      // print(userResponse!.status.toString());
      // print(userResponse!.data.image.toString());
      emit(ProfileSuecussfulyProfile());
    }).catchError((onError) {
      print(onError.toString());
      emit(ProfileErorrProfile());
    });
  }
  // void postEditProfile(
  //     {File? selectedImage,
  //     int? gender,
  //     required String name,
  //     required String email,
  //     required String phone,
  //     required String data,
  //     required String location}) async {
  //   emit(EditProfileLoadingPost());
  //   print(selectedImage.toString() +
  //       gender.toString() +
  //       name.toString() +
  //       email.toString() +
  //       phone.toString() +
  //       data.toString() +
  //       location.toString());
  //   List<int> fileBytes = await selectedImage!.readAsBytes();
  //   print(fileBytes.toString() + "LLLLLKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");

  //   String base64Image = base64Encode(fileBytes);
  //   print(base64Image.toString() +
  //       "LLLLLKKKKKKKKKKKKKKKKKKKKKKKIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIKKKKKKKKKKK");

  //   DioHelper.putData(
  //           "update-profile",
  //           {
  //             // "gender": gender,
  //             "image": base64Image,
  //             "name": name,
  //             "email": email,
  //             // "data": data,
  //             "password": data,

  //             "phone": phone,
  //             // "location": location
  //           },
  //           CachShpreafapp.getdata(key: "tokenProfile"))
  //       .then((value) {
  //     userData = UserData.fromJson(value.data);
  //     // print(userData!.message.toString());
  //     Fluttertoast.showToast(
  //         msg: "ok ",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     emit(EditProfileSueccufilyPost());
  //     // getprofile();
  //     profileCubit.getprofile();
  //     // getdataEidtProfile();
  //   }).catchError((onError) {
  //     Fluttertoast.showToast(
  //         msg: onError.toString(),
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 10,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     emit(EditProfileErrorPost());
  //     print(onError.toString());
  //   });
  // }
  LogoutModel? logoutModel;
  void logOut(BuildContext context) {
    emit(ProfileLogoutLoading());
    DioHelper.postData("logout",
            data: null, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      logoutModel = LogoutModel.fromJson(value.data);
      if (logoutModel!.status == true) {
        CachShpreafapp.remove(key: "tokenProfile");

        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SplashScreen(),
          ),
        );
        // CachShpreafapp.remove(key: "tokenPrfile");
        // print(object)
      }
      emit(ProfileLogoutSceccfuly());
    }).catchError((onError) {
      emit(ProfileLogoutError());
    });
  }
}
