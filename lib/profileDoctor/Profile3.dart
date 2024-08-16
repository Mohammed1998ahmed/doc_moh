import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:doctor/profileDoctor/ConsutionDoctorID/ConsutionDoctorID.dart';
import 'package:doctor/profileDoctor/EditProfile/EditProfile.dart';
import 'package:doctor/profileDoctor/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile2.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ProfileCubit()..getprofile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ProfileCubit.getObject(context);

          return Scaffold(
              backgroundColor: Colors.transparent,
              body: state is ProfileSuecussfulyProfile
                  ? Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imageBackground),
                              fit: BoxFit.cover)),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: Height * 0.02,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Dialog(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        ImagesPath +
                                                            cubit.profileModel!
                                                                .doctor!.image
                                                                .toString()),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23,
                                      child: HexagonImage(
                                        size: 100,
                                        imageUrl: ImagesPath +
                                            cubit.profileModel!.doctor!.image!
                                                .toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Width * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Width * 0.46,
                                      child: text(
                                          title: cubit
                                              .profileModel!.doctor!.firstName
                                              .toString(),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 1,
                                          color: Color0),
                                    ),
                                    SizedBox(
                                      height: Height * 0.01,
                                    ),
                                    Container(
                                      width: Width * 0.4,
                                      child: text(
                                          title: cubit.profileModel!.doctor!
                                              .user!.email!,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 1,
                                          fontWeight: FontWeight.w400,
                                          color: Color7),
                                    ),
                                    SizedBox(
                                      height: Height * 0.02,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Height * 0.03,
                          ),
                          ButtonStaic(
                            context: context,
                            radius: 5,
                            onTap: (() {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      EditProfile(
                                    profileModel: cubit.profileModel,
                                    image: cubit.profileModel!.doctor!.image,
                                  ),
                                ),
                              );
                            }),
                            title: "Edit profile",
                          ),
                          SizedBox(
                            height: Height * 0.03,
                          ),
                          Divider(
                            color: Color.fromRGBO(113, 104, 116, 0.8),
                            thickness: 2,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .004,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            // width: MediaQuery.of(context).size.width * 0.03,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(71, 181, 255, 1),
                                  Color.fromRGBO(
                                      71, 181, 255, 1), // اللون الأصلي
                                  Color.fromRGBO(
                                      199, 255, 255, 1), // اللون المتناسق
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            // color: Colors.amber,
                            child: Center(
                              child: text(
                                  title: cubit.profileModel!.doctor!.user!.email
                                      .toString(),
                                  color: Color3),
                            ),
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     SmoothStarRating(
                            //       color: Color.fromRGBO(228, 179, 67, 1),
                            //       rating: rating,
                            //       // isReadOnly: false,
                            //       size: 25,
                            //       filledIconData: Icons.star,
                            //       halfFilledIconData: Icons.star_half,
                            //       defaultIconData: Icons.star_border,
                            //       starCount: 5,
                            //       allowHalfRating: true,
                            //       spacing: 2.0,
                            //       onRatingChanged: (v) {
                            //         // setState(() {
                            //         //   rating = v;
                            //         // });
                            //       },
                            //     ),
                            //     text(
                            //         title: "   (Assessment)",
                            //         color: Color4,
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w600)
                            //   ],
                            // ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .008,
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * .003,
                          ),
                          Divider(
                            color: Color.fromRGBO(50, 52, 70, 1),
                          ),
                          // Container(
                          //   color: Colors.red,
                          //   height: 50,
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: text(
                                                title: "Birth: ",
                                                color: Color0)),
                                        Expanded(
                                          child: text(
                                              title: cubit
                                                  .profileModel!.doctor!.birth
                                                  .toString(),
                                              color: Color4),
                                        ),
                                        Expanded(
                                            child: text(
                                                title: "Gender: ",
                                                color: Color0)),
                                        Expanded(
                                          child: text(
                                              title: cubit
                                                  .profileModel!.doctor!.gender
                                                  .toString(),
                                              color: Color4),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: text(
                                                title: "Experience: ",
                                                color: Color0)),
                                        Expanded(
                                          child: text(
                                              title: cubit.profileModel!.doctor!
                                                      .experience
                                                      .toString() +
                                                  " Years",
                                              color: Color4),
                                        ),
                                        Expanded(
                                            child: text(
                                                title: "Specialties: ",
                                                color: Color0)),
                                        Expanded(
                                          child: text(
                                              title: cubit.profileModel!.doctor!
                                                  .specialties
                                                  .toString(),
                                              color: Color4),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: text(
                                                title: "mobile: ",
                                                color: Color0)),
                                        Expanded(
                                          child: text(
                                              title: cubit.profileModel!.doctor!
                                                  .user!.mobile
                                                  .toString(),
                                              color: Color4),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Cosulation",
                            icon: Icons.logout,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ConsultationDoctor(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Log out",
                            icon: Icons.logout,
                            onPressed: () {
                              cubit.logOut(context);
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          SizedBox(
                            height: Height * 0.04,
                          )
                        ]),
                      ),
                    )
                  : SpinkitWave());
        },
      ),
    );
  }

  Padding ButtonProfile(
      {required double Height,
      required double Width,
      required BuildContext context,
      IconData? icon,
      required String title,
      required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.5, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
              Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: Height * 0.06,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: Width * 0.03,
            ),
            text(
                // "Booking Order & Appointments"
                title: title,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            Spacer(),
            IconButton(
                onPressed: onPressed,
                // () {edit profile
                //   Navigator.push<void>(
                //     context,
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) => BookingandApp(),
                //     ),
                //   );
                // },
                icon: CircleAvatar(
                  backgroundColor: Color0,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

//  Padding(

//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 15.0),
//                             child: StreamBuilder<UserResponse>(
//                               stream: cubit
//                                   .userResponseStream, // استخدم الـ stream المرتبط بالبيانات
//                               builder: (BuildContext context,
//                                   AsyncSnapshot<UserResponse> snapshot) {
//                                 if (snapshot.hasData) {
//                                   UserResponse user = snapshot.data!;
//                                   return Row(
//                                     children: [
//                                       // text(title: user.data.image),
//                                       Center(
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) =>
//                                                   Dialog(
//                                                 child: Container(
//                                                   width: MediaQuery.of(context)
//                                                           .size
//                                                           .width *
//                                                       0.8,
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       0.6,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             15.0),
//                                                     image: DecorationImage(
//                                                       image: NetworkImage(
//                                                           user.data.image),
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                           child: Container(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.4,
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.22,
//                                             child: HexagonImage(
//                                               size: 100,
//                                               imageUrl: user.data.image,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: Width * 0.02,
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             width: Width * 0.46,
//                                             child: text(
//                                               title: user.data.name,
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w700,
//                                               overflow: TextOverflow.ellipsis,
//                                               softWrap: true,
//                                               maxLines: 1,
//                                               color: Color0,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: Height * 0.01,
//                                           ),
//                                           Container(
//                                             width: Width * 0.4,
//                                             child: text(
//                                               title: user.data.email,
//                                               fontSize: 13,
//                                               overflow: TextOverflow.ellipsis,
//                                               softWrap: true,
//                                               maxLines: 1,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color7,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: Height * 0.02,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   );
//                                 } else if (snapshot.hasError) {
//                                   return Text('Error: ${snapshot.error}');
//                                 } else {
//                                   return CircularProgressIndicator();
//                                 }
//                               },
//                             ),
//                           ),
