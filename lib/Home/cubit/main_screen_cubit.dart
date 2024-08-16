import 'dart:convert';

import 'package:doctor/ChatPage/Person.dart';
import 'package:doctor/ChatPage/chat.dart';
import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:doctor/consultation/12.dart';
import 'package:doctor/consultation/consultation.dart';
import 'package:doctor/profile/profile.dart';
import 'package:doctor/profileDoctor/Profile3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());
  static MainScreenCubit getObject(context) =>
      BlocProvider.of<MainScreenCubit>(context);

//   void configurePusher() async {
//     PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//     // pusher.connectionState.
//     try {
//       // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
//       await pusher.init(
//         apiKey: "e5d6ede1b86a447371cc",
//         cluster: "eu",
//         useTLS: true,
//         // authEndpoint: "https://192.168.109.241:8000/api/pusher/authenticate",
//         // onEvent: (event) {
//         //   print(event.data.toString());
//         // },
//         // onError: (String moh, int? id, dynamic inmess) {
//         //   print(moh + id.toString() + inmess.toString());
//         // },
//         // authEndpoint: ,
//         // authParams: ,
//         // useTLS: true,
//         onConnectionStateChange: onConnectionStateChange,
//         onError: onError,
//         onSubscriptionSucceeded: onSubscriptionSucceeded,
//         onEvent: (event) {
//           print("onEventerererer: ${event.data}" +
//               "((((((((((9999999999999999999999999999999))))))))))");
//           final data = json.decode(event.data);
//           print("onEventerererer: $event");

//           if (data["message"] != null) {
//             print("onEventerererer: ${data["message"]}" +
//                 "((((((((((9999999999999999999999999999999))))))))))");
//             LocalNotifations.simpleLocalNotifation(
//                 title: "Add Trinner",
//                 body: data["message"].toString(),
//                 payload: "payload");
//           }

//           emit(MainScreenConfigPusheTrinnerEvent());
//         },
//         onSubscriptionError: onSubscriptionError,
//         onDecryptionFailure: onDecryptionFailure,
//         onMemberAdded: onMemberAdded,
//         onMemberRemoved: onMemberRemoved,
//         // onConnectionStateChange: onConnectionStateChange,
//         // onError: onError,
//         // onSubscriptionSucceeded: onSubscriptionSucceeded,
//         // onEvent: onEvent,
//         // onSubscriptionError: onSubscriptionError,
//         // onDecryptionFailure: onDecryptionFailure,
//         // onMemberAdded: onMemberAdded,
//         // onMemberRemoved: onMemberRemoved,
//         // authEndpoint: "<Your Authendpoint>",
//         // onAuthorizer: onAuthorizer1,
//       );
//       await pusher.subscribe(channelName: "trainer", onEvent: onEvent11);
// // await pusher.trigger(onEvent: onEvent1);
//       emit(MainScreenConfigPusheTrinner());
//       // await pusher.onev
//       await pusher.connect();
//     } catch (e) {
//       print("ERROR: $e" + e.toString());
//     }
//   }

//   void onEvent11(dynamic event) {
//     print("onEvent: $event");
//     // print("onEvent: $event["data"]["message"].toString());
//     final data = json.decode(event.data);
//     if (data["message"] != null) {
//       print("onEventerererer: ${data["message"]}" +
//           "((((((((((9999999999999999999999999999999))))))))))");
//       LocalNotifations.simpleLocalNotifation(
//           title: "Add Trinner",
//           body: data["message"].toString(),
//           payload: "payload");
//     }
//     LocalNotifations.simpleLocalNotifation(
//         title: "Add Trinner", body: "sssssssssssssss", payload: "payload");
//     emit(MainScreenConfigPusheTrinnerEvent());
//   }

  bool isLoad = false;
  void chaingLoading(bool Loading) {
    this.isLoad = Loading;
    emit(MainScreenChaingLoadingSearch());
  }

  bool about = true;
  void chaingBoolean(bool aboutPage) {
    this.about = aboutPage;
    emit(MainScreenChaingBoolean());
  }

  // void postSearch({required String Search}) {
  //   emit(MainScreenLoadingSearch());
  //   DioHelper.postData("Search", data: {"searchStable": Search}).then((value) {
  //     print("Sececcfully Search");
  //     emit(MainScreenSececcfullySearch());
  //   }).catchError((onError) {
  //     print("Error Search");
  //     emit(MainScreenErrorSearch());
  //   });
  // }

  List<Widget> ListWidght = [
    ConsultationDoctor(),
    ChatListScreen(),
    Profile2(),

    // ServieseScreen()
  ];

  int index = 0;
  chaingindex(int chainginadexs) {
    this.index = chainginadexs;
    emit(MainScreenChaingIndex());
  }

  List<Widget> iconNav() {
    return [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // SizedBox(
            //   height: 6,
            // ),

            Icon(
              Icons.home_outlined,
              size: 30,
              color: Color3,
            ),

            text(
                title: "Home",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white)
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(15),
      //   child: Column(
      //     children: [
      //       // SizedBox(
      //       //   height: 6,
      //       // ),

      //       Icon(
      //         Icons.location_on_outlined,
      //         size: 30,
      //         color: Color3,
      //       ),

      //       text(
      //           title: "Near by",
      //           fontSize: 8,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.white)
      //     ],
      //   ),
      // ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Color3,
              size: 30,
            ),
            text(
                title: "chat",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: 30,
              color: Color3,
            ),
            text(
                title: "Profile",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white)
          ],
        ),
      ),
    ];
  }
}
