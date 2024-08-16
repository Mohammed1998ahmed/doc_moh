import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor/ChatPage/cubit/chat_cubit.dart';
import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:doctor/mPusherConig/piusherConfig.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class ChatScreen extends StatefulWidget {
  final int ID_User;
  final String FNameTrinner;
  // final String LNameTrinner;
  final List<int>? idChat;
  final String ImageDoctor;

  const ChatScreen({
    super.key,
    required this.ID_User,
    required this.ImageDoctor,
    required this.FNameTrinner,
    this.idChat,
  });
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        sender: 'User',
        text: 'Hellovv',
        time: DateTime.now(),
        isDelivered: true),
    Message(
        sender: 'Friend',
        text: 'Hi there!',
        time: DateTime.now(),
        isDelivered: false),
  ];
  File? imageFile;
  final picker = ImagePicker();
  TextEditingController _textEditingController = TextEditingController();
  String? pickedFile; // تحديد المتغير العالمي

  // ignore: unused_element
  void _sendMessage() {
    if (_textEditingController.text.isEmpty && imageFile == null) return;

    setState(() {
      messages.add(
        Message(
          sender: 'User',
          text: _textEditingController.text,
          time: DateTime.now(),
          imageFile: imageFile,
          isDelivered: true,
        ),
      );

      _textEditingController.clear();
      imageFile = null;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.ID_Trinner.toString() +
    //     "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO" +
    //     widget.ImageTrinner.toString() +
    //     "KKKKKKKKKKKKKKKKKKK");
    return BlocProvider(
      create: (context) => ChatCubit()
        ..getDataMessage(
            User_Id: 12, Doctor_Id: CachShpreafapp.getdata(key: "UserIDD"))
        ..configurePusher(User_ID: 12),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is ChatGetSceccfully) {
            if (widget.idChat!.length > 0) {
              for (int i = 0; i < widget.idChat!.length; i++) {
                ChatCubit.getObject(context)
                    .getLIstChatReadisModel(id: widget.idChat![i]);
              }
            }
          }
        },
        builder: (context, state) {
          final cubit = ChatCubit.getObject(context);
          // configurePusher(cubit);
          print(cubit.pusherMessage.toString() +
              "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
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
                    icon: Icon(Icons.arrow_back, color: Color0),
                  ),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: text(
                            title: "${widget.FNameTrinner}",
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color0,
                          ),
                        )
                      ]),
                  actions: [
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.menu,
                    //       color: Color0,
                    //     ))

                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: cubit.chatModelGetData == null
                          ? Center(child: SpinkitWave())
                          : ListView.builder(
                              controller: cubit.scrollController,
                              itemCount: cubit.chatModelGetData!.chats!.length,
                              itemBuilder: (BuildContext context, int index) {
                                // Message message = messages[index];
                                // bool isUser = message.sender == 'User';

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: cubit.chatModelGetData!
                                                .chats![index].doctor ==
                                            1
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      cubit.chatModelGetData!.chats![index]
                                                  .doctor ==
                                              1
                                          ? Container()
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  ImagesPath +
                                                      widget.ImageDoctor),
                                            ),
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: cubit.chatModelGetData!
                                                      .chats![index].doctor ==
                                                  1
                                              ? Color0
                                              : Color.fromRGBO(
                                                  50, 52, 70, 0.85),
                                          borderRadius: cubit.chatModelGetData!
                                                      .chats![index].doctor ==
                                                  1
                                              ? BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10))
                                              : BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: cubit
                                                      .chatModelGetData!
                                                      .chats![index]
                                                      .doctor ==
                                                  1
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                          children: [
                                            cubit.chatModelGetData!
                                                        .chats![index].image !=
                                                    null
                                                ? GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            content: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.8,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.6,
                                                              child:
                                                                  Image.network(
                                                                ImagesPath +
                                                                    cubit
                                                                        .chatModelGetData!
                                                                        .chats![
                                                                            index]
                                                                        .image
                                                                        .toString(),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      child: Image.network(
                                                        ImagesPath +
                                                            cubit
                                                                .chatModelGetData!
                                                                .chats![index]
                                                                .image
                                                                .toString(), // تمرير مسار الصورة المحددة هنا
                                                        fit: BoxFit
                                                            .cover, // اختيار تناسب الصورة في العرض
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            cubit
                                                        .chatModelGetData!
                                                        .chats![index]
                                                        .content ==
                                                    null
                                                ? Container()
                                                : Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: text(
                                                      title: cubit
                                                          .chatModelGetData!
                                                          .chats![index]
                                                          .content
                                                          .toString(),
                                                      fontSize: 14.0,
                                                      color: cubit
                                                                  .chatModelGetData!
                                                                  .chats![index]
                                                                  .doctor ==
                                                              1
                                                          ? Color.fromRGBO(
                                                              33, 35, 39, 1)
                                                          : Color(0xDDFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                            SizedBox(height: 4.0),
                                            Row(
                                              mainAxisAlignment: cubit
                                                          .chatModelGetData!
                                                          .chats![index]
                                                          .doctor ==
                                                      1
                                                  ? MainAxisAlignment.end
                                                  : MainAxisAlignment.start,
                                              children: [
                                                cubit
                                                            .chatModelGetData!
                                                            .chats![index]
                                                            .time ==
                                                        null
                                                    ? Container()
                                                    : Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        child: text(
                                                          title: cubit
                                                              .chatModelGetData!
                                                              .chats![index]
                                                              .time
                                                              .toString(),
                                                          fontSize: 14.0,
                                                          color: cubit
                                                                      .chatModelGetData!
                                                                      .chats![
                                                                          index]
                                                                      .doctor ==
                                                                  1
                                                              ? Color.fromRGBO(
                                                                  33, 35, 39, 1)
                                                              : Color(
                                                                  0xDDFFFFFF),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                SizedBox(width: 4.0),
                                                if (cubit.chatModelGetData!
                                                        .chats![index].doctor ==
                                                    1)
                                                  Icon(
                                                    cubit
                                                                .chatModelGetData!
                                                                .chats![index]
                                                                .doctor ==
                                                            1
                                                        ? Icons.done_all
                                                        : Icons.done,
                                                    size: 16.0,
                                                    color: Colors.grey,
                                                  ),
                                              ],
                                            ),
                                          ],
                                          // children: [
                                          //   message.imageFile != null
                                          //       ? Container(
                                          //           width: 200,
                                          //           height: 200,
                                          //           child: Image.file(
                                          //             File(message.imageFile!
                                          //                 .path), // تمرير مسار الصورة المحددة هنا
                                          //             fit: BoxFit
                                          //                 .cover, // اختيار تناسب الصورة في العرض
                                          //           ),
                                          //         )
                                          //       : text(
                                          //           title: message.text,
                                          //           fontSize: 14.0,
                                          //           color: isUser
                                          //               ? Color.fromRGBO(
                                          //                   33, 35, 39, 1)
                                          //               : Color.fromRGBO(255,
                                          //                   255, 255, 0.87),
                                          //           fontWeight: FontWeight.w400,
                                          //         ),
                                          //   SizedBox(height: 4.0),
                                          //   Row(
                                          //     mainAxisAlignment: isUser
                                          //         ? MainAxisAlignment.end
                                          //         : MainAxisAlignment.start,
                                          //     children: [
                                          //       text(
                                          //           title:
                                          //               '${message.time.hour}:${message.time.minute}',
                                          //           fontSize: 12.0,
                                          //           color: Colors.grey),
                                          //       SizedBox(width: 4.0),
                                          //       if (isUser)
                                          //         Icon(
                                          //           message.isDelivered
                                          //               ? Icons.done_all
                                          //               : Icons.done,
                                          //           size: 16.0,
                                          //           color: Colors.grey,
                                          //         ),
                                          //     ],
                                          //   ),
                                          // ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                    // Expanded(
                    //   child: cubit.chatModelGetData == null
                    //       ? CircularProgressIndicator()
                    //       : ListView.builder(
                    //           itemCount: cubit.pusherMessage.length,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             Message message = messages[index];
                    //             bool isUser = message.sender == 'User';

                    //             return Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Row(
                    //                 mainAxisAlignment: cubit.chatModelGetData!
                    //                             .chats![index].user ==
                    //                         1
                    //                     ? MainAxisAlignment.end
                    //                     : MainAxisAlignment.start,
                    //                 children: [
                    //                   // text(title: title)
                    //                   cubit.chatModelGetData!.chats![index]
                    //                               .user ==
                    //                           1
                    //                       ? Container()
                    //                       : CircleAvatar(
                    //                           backgroundImage: AssetImage(
                    //                               "assets/images/Person.jpg"),
                    //                         ),
                    //                   Container(
                    //                     margin: EdgeInsets.all(10.0),
                    //                     padding: EdgeInsets.all(10.0),
                    //                     decoration: BoxDecoration(
                    //                       color: cubit.chatModelGetData!
                    //                                   .chats![index].user ==
                    //                               1
                    //                           ? Color0
                    //                           : Color.fromRGBO(
                    //                               50, 52, 70, 0.85),
                    //                       borderRadius: cubit.chatModelGetData!
                    //                                   .chats![index].user ==
                    //                               1
                    //                           ? BorderRadius.only(
                    //                               bottomLeft:
                    //                                   Radius.circular(10),
                    //                               topLeft: Radius.circular(10),
                    //                               topRight: Radius.circular(10))
                    //                           : BorderRadius.only(
                    //                               bottomLeft:
                    //                                   Radius.circular(10),
                    //                               bottomRight:
                    //                                   Radius.circular(10),
                    //                               topRight:
                    //                                   Radius.circular(10)),
                    //                     ),
                    //                     child: Column(
                    //                       crossAxisAlignment: cubit
                    //                                   .chatModelGetData!
                    //                                   .chats![index]
                    //                                   .user ==
                    //                               1
                    //                           ? CrossAxisAlignment.end
                    //                           : CrossAxisAlignment.start,
                    //                       // children: [
                    //                       //   cubit.chatModelGetData!
                    //                       //               .chats![index].image !=
                    //                       //           null
                    //                       //       ? Container(
                    //                       //           width: 200,
                    //                       //           height: 200,
                    //                       //           child: Image.network(
                    //                       //             ImagesPath +
                    //                       //                 cubit
                    //                       //                     .chatModelGetData!
                    //                       //                     .chats![index]
                    //                       //                     .image
                    //                       //                     .toString(), // تمرير مسار الصورة المحددة هنا
                    //                       //             fit: BoxFit
                    //                       //                 .cover, // اختيار تناسب الصورة في العرض
                    //                       //           ),
                    //                       //         )
                    //                       //       : Container(),
                    //                       //   text(
                    //                       //     title: cubit.chatModelGetData!
                    //                       //         .chats![index].content
                    //                       //         .toString(),
                    //                       //     fontSize: 14.0,
                    //                       //     color: cubit.chatModelGetData!
                    //                       //                 .chats![index].user ==
                    //                       //             1
                    //                       //         ? Color.fromRGBO(
                    //                       //             33, 35, 39, 1)
                    //                       //         : Color.fromRGBO(
                    //                       //             255, 255, 255, 0.87),
                    //                       //     fontWeight: FontWeight.w400,
                    //                       //   ),
                    //                       //   SizedBox(height: 4.0),
                    //                       //   Row(
                    //                       //     mainAxisAlignment: cubit
                    //                       //                 .chatModelGetData!
                    //                       //                 .chats![index]
                    //                       //                 .user ==
                    //                       //             1
                    //                       //         ? MainAxisAlignment.end
                    //                       //         : MainAxisAlignment.start,
                    //                       //     children: [
                    //                       //       text(
                    //                       //           title: "",
                    //                       //           // '${message.time.hour}:${message.time.minute}',
                    //                       //           fontSize: 12.0,
                    //                       //           color: Colors.grey),
                    //                       //       SizedBox(width: 4.0),
                    //                       //       if (cubit.chatModelGetData!
                    //                       //               .chats![index].user ==
                    //                       //           1)
                    //                       //         Icon(
                    //                       //           cubit
                    //                       //                       .chatModelGetData!
                    //                       //                       .chats![index]
                    //                       //                       .user ==
                    //                       //                   1
                    //                       //               ? Icons.done_all
                    //                       //               : Icons.done,
                    //                       //           size: 16.0,
                    //                       //           color: Colors.grey,
                    //                       //         ),
                    //                       //     ],
                    //                       //   ),
                    //                       // ],
                    //                       children: [
                    //                         message.imageFile != null
                    //                             ? Container(
                    //                                 width: 200,
                    //                                 height: 200,
                    //                                 child: Image.file(
                    //                                   File(message.imageFile!
                    //                                       .path), // تمرير مسار الصورة المحددة هنا
                    //                                   fit: BoxFit
                    //                                       .cover, // اختيار تناسب الصورة في العرض
                    //                                 ),
                    //                               )
                    //                             : text(
                    //                                 title: message.text,
                    //                                 fontSize: 14.0,
                    //                                 color: isUser
                    //                                     ? Color.fromRGBO(
                    //                                         33, 35, 39, 1)
                    //                                     : Color.fromRGBO(255,
                    //                                         255, 255, 0.87),
                    //                                 fontWeight: FontWeight.w400,
                    //                               ),
                    //                         SizedBox(height: 4.0),
                    //                         Row(
                    //                           mainAxisAlignment: isUser
                    //                               ? MainAxisAlignment.end
                    //                               : MainAxisAlignment.start,
                    //                           children: [
                    //                             text(
                    //                                 title:
                    //                                     '${message.time.hour}:${message.time.minute}',
                    //                                 fontSize: 12.0,
                    //                                 color: Colors.grey),
                    //                             SizedBox(width: 4.0),
                    //                             if (isUser)
                    //                               Icon(
                    //                                 message.isDelivered
                    //                                     ? Icons.done_all
                    //                                     : Icons.done,
                    //                                 size: 16.0,
                    //                                 color: Colors.grey,
                    //                               ),
                    //                           ],
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             );
                    //           },
                    //         ),
                    // ),
                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                              ),
                              onPressed: () {
                                _pickImage();
                              }

                              // onPressed: () async {
                              //   FilePickerResult? result =
                              //       await FilePicker.platform.pickFiles();
                              //   if (result != null) {
                              //     // قم بمعالجة الملف المحدد هنا
                              //     // يمكنك الحصول على مسار الملف باستخدام result.files.single.path
                              //     print(result.files.single.path.toString());
                              //     pickedFile = result.files.single.path.toString();
                              //     setState(() {
                              //       // إعادة بناء الواجهة لعرض الصورة المحددة
                              //     });
                              //   } // إضافة الكود الخاص بإرسال الملفات
                              // },
                              ),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.attach_file,
                          //     color: Color.fromRGBO(255, 255, 255, 0.5),
                          //   ),
                          //   onPressed: () async {
                          //     final picker = ImagePicker();
                          //     pickedFile =
                          //         await picker.getImage(source: ImageSource.gallery);
                          //     if (pickedFile != null) {
                          //       setState(() {
                          //         // إعادة بناء الواجهة لعرض الصورة المحددة
                          //       });
                          //     }
                          //   },
                          // ),
                          IconButton(
                            icon: Icon(
                              Icons.emoji_emotions,
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                            ),
                            onPressed: () {
                              // إضافة الكود الخاص بإظهار رموز التعبيرية (الإيموجي)
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 35, 39, 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextField(
                                  controller: _textEditingController,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '   Write a comment…',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(142, 142, 147, 1),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Color.fromRGBO(225, 204, 232, 1),
                            ),
                            onPressed: () {
                              if (_textEditingController.text.isEmpty &&
                                  imageFile == null) return;
                              cubit.postMessage(
                                  user_id: 12,
                                  doctor_id:
                                      CachShpreafapp.getdata(key: "UserIDD"),
                                  content: _textEditingController.text,
                                  imageFile: imageFile);

                              print(imageFile.toString() +
                                  "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIOOOOOOOOOOOIIIIIIII");
                              setState(() {
                                messages.add(
                                  Message(
                                    sender: 'User',
                                    text: _textEditingController.text,
                                    time: DateTime.now(),
                                    imageFile: imageFile,
                                    isDelivered: true,
                                  ),
                                );

                                _textEditingController.clear();
                                imageFile = null;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final File? imageFile;

  final DateTime time;
  final bool isDelivered;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    this.imageFile,
    this.isDelivered = false,
  });
}

void configurePusher(ChatCubit chatCubit) async {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  // pusher.connectionState.
  try {
    // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
    await pusher.init(
      apiKey: "e5d6ede1b86a447371cc",
      cluster: "eu",
      useTLS: true,
      // authEndpoint: "https://192.168.109.241:8000/api/pusher/authenticate",
      onEvent: (event) {
        print(event.data.toString());
        chatCubit.pusherMessage.add(event.data);
      },
      // onError: (String moh, int? id, dynamic inmess) {
      //   print(moh + id.toString() + inmess.toString());
      // },
      // authEndpoint: ,
      // authParams: ,
      // useTLS: true,
      onConnectionStateChange: onConnectionStateChange,
      onError: onError,
      onSubscriptionSucceeded: onSubscriptionSucceeded,
      // onEvent: onEvent,
      onSubscriptionError: onSubscriptionError,
      onDecryptionFailure: onDecryptionFailure,
      onMemberAdded: onMemberAdded,
      onMemberRemoved: onMemberRemoved,
      // onConnectionStateChange: onConnectionStateChange,
      // onError: onError,
      // onSubscriptionSucceeded: onSubscriptionSucceeded,
      // onEvent: onEvent,
      // onSubscriptionError: onSubscriptionError,
      // onDecryptionFailure: onDecryptionFailure,
      // onMemberAdded: onMemberAdded,
      // onMemberRemoved: onMemberRemoved,
      // authEndpoint: "<Your Authendpoint>",
      onAuthorizer: onAuthorizer1,
    );
    await pusher.subscribe(
        channelName: "private-private.chat1-1", onEvent: onEvent1);
// await pusher.trigger(onEvent: onEvent1);

    // await pusher.onev
    await pusher.connect();
  } catch (e) {
    print("ERROR: $e" + e.toString());
  }
}

// app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"

dynamic onAuthorizer1(
    String channelName, String socketId, dynamic options) async {
  // socketId = "180192.65836375";

  // channelName = "private-private.chat2-1";
  print('////onAuthorizer' + socketId + channelName);

////////////////////////
  try {
    FormData formData = FormData.fromMap({
      "socketId": socketId,
      "channelName": channelName,
    });
    // String token = await CachShpreafapp.getdata(key: "tokenProfile");
    final response = await DioHelper.dio!.post(
      "pusher/authenticate",
      data: formData,
    );

    var json = jsonDecode(response.data);
    print(json.toString() +
        "(((((((((((((((((((((((((99999999999)))))))))))))))))))))))))");
    return json;
  } catch (e) {
    print(e.toString());
    print(
        "LLLLLLLfgfgfgfggggggggggggggggggggLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
    rethrow;
  }
}
