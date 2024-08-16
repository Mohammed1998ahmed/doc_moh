import 'dart:io';

import 'package:doctor/Home/main_screen.dart';
import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:doctor/profileDoctor/EditProfile/cubit/edit_profile_cubit.dart';
import 'package:doctor/profileDoctor/EditProfile/edit.dart';
import 'package:doctor/profileDoctor/model/getProfileModel.dart';
import 'package:doctor/profileDoctor/profile2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _HexagonButtonPageState();
  final String? image;
  final ProfileModel? profileModel;
  EditProfile({this.image, this.profileModel});
}

class _HexagonButtonPageState extends State<EditProfile> {
  int selectedValue = 1;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();

  // TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerLocation = TextEditingController();
  // TextEditingController controllerDate = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  int? gender1;
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSueccufilyPost) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => MainScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = EditProfileCubit.geyObject(context);

          return Scaffold(
            body: Stack(children: [
              Image.asset(
                imageBackground,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color0,
                      size: 30,
                    ),
                  ),
                  title: Container(
                    width: 230,
                    alignment: Alignment.center,
                    child: text(
                        title: 'Edit Profile',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color0),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                HexagonLine(lineColor: Color0, size: 130),
                                Container(
                                  width: Width * 0.3,
                                  height: Height * 0.2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: Width * 0.3,
                                        child: HexagonImage(
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          selectedImage1: _selectedImage,
                                          imageProfile: widget.image,
                                          // حجم الشكل السداسي
                                          // imageUrl: "", // عنوان URL للصورة
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            _pickImage();
                                          },
                                          icon: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Color0,
                                            size: 35,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Container(
                            //   width: Width * 0.34,
                            //   height: Height * 0.19,
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       text(
                            //           title: "Gender",
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.w700,
                            //           color: Color.fromRGBO(0, 0, 0, 0.5)),
                            //       Expanded(
                            //         child: RadioListTile(
                            //           activeColor: Color0,
                            //           // tileColor: Colors.red,

                            //           title: text(
                            //               title: 'Male',
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w400),
                            //           value: 1,
                            //           contentPadding: EdgeInsets.zero,

                            //           groupValue: selectedValue,
                            //           onChanged: (value) {
                            //             setState(() {
                            //               selectedValue = value as int;
                            //               gender1 = 1;
                            //             });
                            //           },
                            //         ),
                            //       ),
                            //       Expanded(
                            //         // أو Flexible
                            //         child: RadioListTile(
                            //           activeColor: Color0,
                            //           title: text(
                            //               title: 'Woman',
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w400),
                            //           value: 2,
                            //           contentPadding: EdgeInsets.zero,
                            //           groupValue: selectedValue,
                            //           onChanged: (value) {
                            //             setState(() {
                            //               selectedValue = value as int;
                            //               gender1 = 0;
                            //             });
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        Divider(
                          color: Color.fromRGBO(113, 104, 116, 0.8),
                        ),
                        SizedBox(
                          height: Height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFieldWidght(
                              widthC: MediaQuery.of(context).size.width * 0.4,
                              controller: controllerName,
                              context: context,
                              suffixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color0,
                              ),
                              hintText: widget.profileModel!.doctor!.firstName
                                      .toString() ??
                                  "Name",
                              messageForm: 'Enter your Name',
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              width: Width * 0.0150,
                            ),
                            TextFieldWidght(
                              widthC: MediaQuery.of(context).size.width * 0.4,
                              controller: controllerLastName,
                              context: context,
                              suffixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color0,
                              ),
                              hintText: widget.profileModel!.doctor!.lastName
                                      .toString() ??
                                  "Last Name",
                              messageForm: 'Enter your Last Name',
                              keyboardType: TextInputType.name,
                            ),
                          ],
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.90,
                        //   height: 44,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Color0,
                        //       width: 2.0,
                        //     ),
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 25, bottom: 3),
                        //     child: TextFormField(
                        //       controller: controllerName,
                        //       keyboardType: TextInputType.name,
                        //       decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         suffixIcon: Icon(
                        //           Icons.person_2_outlined,
                        //           color: Color0,
                        //         ),
                        //         hintStyle: TextStyle(
                        //             color: Color2,
                        //             fontSize: 15,
                        //             fontFamily: 'Caveat',
                        //             fontWeight: FontWeight.w400),
                        //         hintText: "Mohammed Ahmed",
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: Height * 0.02,
                        ),
                        TextFieldWidght(
                          widthC: MediaQuery.of(context).size.width * 0.82,
                          controller: controllerPhone,
                          context: context,
                          suffixIcon: Icon(
                            Icons.phone_android,
                            color: Color0,
                          ),
                          hintText: "Mobile : " +
                              widget.profileModel!.doctor!.user!.mobile
                                  .toString(),
                          messageForm: 'Enter your Mobile',
                          keyboardType: TextInputType.phone,
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.90,
                        //   height: 44,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Color0,
                        //       width: 2.0,
                        //     ),
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 25, bottom: 3),
                        //     child: TextFormField(
                        //       controller: controllerEmail,
                        //       keyboardType: TextInputType.emailAddress,
                        //       decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         suffixIcon: Icon(
                        //           Icons.email_outlined,
                        //           color: Color0,
                        //         ),
                        //         hintStyle: TextStyle(
                        //             color: Color2,
                        //             fontSize: 15,
                        //             fontFamily: 'Caveat',
                        //             fontWeight: FontWeight.w400),
                        //         hintText: "Mohammed@gmail.com",
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: Height * 0.02,
                        ),
                        TextFieldWidght(
                          widthC: MediaQuery.of(context).size.width * 0.82,
                          controller: controllerLocation,
                          context: context,
                          suffixIcon: Icon(
                            Icons.location_city,
                            color: Color0,
                          ),
                          hintText: "Description : " +
                                  widget.profileModel!.doctor!.description
                                      .toString() ??
                              "",
                          messageForm: 'Enter your Address',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.90,
                        //   height: 44,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Color0,
                        //       width: 2.0,
                        //     ),
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 25, bottom: 3),
                        //     child: TextFormField(
                        //       controller: controllerDate,
                        //       keyboardType: TextInputType.datetime,
                        //       decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         suffixIcon: Icon(
                        //           Icons.app_registration_rounded,
                        //           color: Color0,
                        //         ),
                        //         hintStyle: TextStyle(
                        //             color: Color2,
                        //             fontSize: 15,
                        //             fontFamily: 'Caveat',
                        //             fontWeight: FontWeight.w400),
                        //         hintText: "24 March 1982",
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: Height * 0.02,
                        ),
                        // SizedBox(
                        //   height: Height * 0.03,
                        // ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.90,
                        //   height: 44,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Color0,
                        //       width: 2.0,
                        //     ),
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 25, bottom: 3),
                        //     child: TextFormField(
                        //       controller: controllerPhone,
                        //       keyboardType: TextInputType.number,
                        //       decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         suffixIcon: Container(
                        //             width: 70,
                        //             child: Icon(
                        //               Icons.phone,
                        //               color: Color0,
                        //             )),
                        //         prefixIcon: Container(
                        //           width: 70,
                        //           child: Row(children: [
                        //             text(
                        //                 title: "+971",
                        //                 color: Color.fromRGBO(0, 0, 0, 0.5),
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.w400),
                        //             Icon(
                        //               Icons.arrow_drop_down,
                        //               color: Color0,
                        //             )
                        //           ]),
                        //         ),
                        //         hintStyle: TextStyle(
                        //             color: Color2,
                        //             fontSize: 15,
                        //             fontFamily: 'Caveat',
                        //             fontWeight: FontWeight.w400),
                        //         hintText: "508840232",
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: Height * 0.03,
                        // ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.90,
                        //   height: 44,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Color0,
                        //       width: 2.0,
                        //     ),
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 25, bottom: 3),
                        //     child: TextFormField(
                        //       controller: controllerLocation,
                        //       keyboardType: TextInputType.name,
                        //       decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         suffixIcon: Icon(
                        //           Icons.arrow_drop_down,
                        //           color: Color0,
                        //         ),
                        //         hintStyle: TextStyle(
                        //             color: Color2,
                        //             fontFamily: 'Caveat',
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.w400),
                        //         hintText: "Dubai, United Arab Emirates",
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                          width: Width * 0.8,
                          height: Height * 0.06,
                          alignment: Alignment.center,
                          child: text(
                              title:
                                  "Your email verification is still pending.Please verify your account. ",
                              textAlign: TextAlign.center,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        SizedBox(
                          height: Height * 0.05,
                        ),
                        state is EditProfileLoadingPost
                            ? SpinkitWave()
                            : ButtonStaic(
                                context: context,
                                title: "Update Profile",
                                onTap: () {
                                  if (keyForm.currentState!.validate()) {
                                    if (_selectedImage != null) {
                                      //////////////////////////////////////////////////////////
                                      cubit.postEditProfile(
                                        context: context,
                                        selectedImage: _selectedImage,
                                        // gender: gender1,
                                        name: controllerName.text,
                                        lastName: controllerLastName.text,
                                        // email: controllerEmail.text,
                                        phone: controllerPhone.text,
                                        descreption: controllerLocation.text,
                                        // data: controllerDate.text
                                      );
                                      // print(controllerName.text +

                                      //     controllerPhone.text +
                                      //     controllerLocation.text);
                                      print("الحمد لله رب العالمين");
                                    }
                                  }
                                }),
                        SizedBox(
                          height: 34,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
