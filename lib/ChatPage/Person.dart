// ignore_for_file: must_be_immutable

import 'package:doctor/ChatPage/chat.dart';
import 'package:doctor/ChatPage/cubit/chat_cubit.dart';
import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Conversation {
  final String name;
  final String message;
  final String image;
  final int unreadMessages;
  final DateTime messageTime; // حقل لتخزين وقت إرسال الرسالة

  Conversation({
    required this.name,
    required this.message,
    required this.image,
    required this.unreadMessages,
    required this.messageTime,
  });
}

class ChatListScreen extends StatelessWidget {
  final List<Conversation> conversations = [
    Conversation(
      name: 'Mohammed Ahmed',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/Person.jpg',
      unreadMessages: 70,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Dino Waelchi',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/james-person-1.jpg',
      unreadMessages: 40,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Dino Waelchi',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/james-person-1.jpg',
      unreadMessages: 40,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Dino Waelchi',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/james-person-1.jpg',
      unreadMessages: 40,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Daniel William',
      message: 'Hey!',
      image: 'assets/images/Person.jpg',
      unreadMessages: 30,
      messageTime:
          DateTime(2023, 10, 18, 14, 45), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Victor Black',
      message: 'Which kind of package & offers provide?',
      image: 'assets/images/unnamed.jpg',
      unreadMessages: 20,
      messageTime:
          DateTime(2023, 10, 18, 14, 45), // تعيين وقت إرسال الرسالة هنا
    ),

    // Add more conversations as needed
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ChatCubit()..getLIstChatTrinner(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ChatCubit.getObject(context);

          return Scaffold(
              body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: Container(),
                title: Center(
                  child: text(
                      title: "Messages",
                      color: Color.fromRGBO(90, 0, 114, 1),
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                // actions: [
                //   IconButton(
                //       onPressed: () {},
                //       icon: Icon(
                //         Icons.more_vert,
                //         color: Color.fromRGBO(90, 0, 114, 0.87),
                //       ))
                // ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/Chat-cuate.png",
                      width: width * 0.60,
                      height: height * 0.3,
                    ),
                    Divider(
                      color: Color.fromRGBO(138, 134, 139, 0.8),
                    ),
                    cubit.listChatsTrinnerModel == null
                        ? Container()
                        : Container(
                            width: width,
                            height: height * 0.46,
                            child: ListView.separated(
                              itemCount:
                                  cubit.listChatsTrinnerModel!.chatList == null
                                      ? 0
                                      : cubit.listChatsTrinnerModel!.chatList!
                                          .length,
                              separatorBuilder: (BuildContext, int) => Divider(
                                color: Color.fromRGBO(138, 134, 139, 0.8),
                              ),
                              itemBuilder: (context, index) {
                                final conversation = conversations[index];
                                return cubit.shimmer
                                    ? ShimmerWidght(
                                        width: width, height: height)
                                    : ListTile(
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              ImagesPath +
                                                  cubit.listChatsTrinnerModel!
                                                      .chatList![index].image
                                                      .toString()),
                                        ),
                                        title: text(
                                          title: cubit.listChatsTrinnerModel!
                                              .chatList![index].userName
                                              .toString(),
                                          fontSize: 16.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.87),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        subtitle: text(
                                          title: cubit.listChatsTrinnerModel!
                                              .chatList![index].lastMessage
                                              .toString(),
                                          fontSize: 15.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.87),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        trailing: Container(
                                          width: width * 0.13,
                                          child: cubit
                                                      .listChatsTrinnerModel!
                                                      .chatList![index]
                                                      .unreadMessages ==
                                                  0
                                              ? Container(
                                                  child: text(
                                                    title: cubit
                                                        .listChatsTrinnerModel!
                                                        .chatList![index]
                                                        .lastMessageTime
                                                        .toString(),
                                                    fontSize: 12.0,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.4),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Text(
                                                    //   conversation.message,
                                                    //   style: TextStyle(
                                                    //       color: Color.fromRGBO(0, 0, 0, 0.5),
                                                    //       fontSize: 13,
                                                    //       fontWeight: FontWeight.w400),
                                                    // ),
                                                    Column(
                                                      children: [
                                                        text(
                                                          title: cubit
                                                              .listChatsTrinnerModel!
                                                              .chatList![index]
                                                              .lastMessageTime
                                                              .toString(),
                                                          fontSize: 12.0,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.4),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Color0,
                                                            ),
                                                            child: text(
                                                              title: cubit
                                                                  .listChatsTrinnerModel!
                                                                  .chatList![
                                                                      index]
                                                                  .unreadMessages
                                                                  .toString(),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.0,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                        ),
                                        onTap: () {
                                          print(
                                              "   sdfffffffffffffffffffffffffffff");
                                          Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  ChatScreen(
                                                ID_User: int.parse(cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .userId
                                                    .toString()),
                                                FNameTrinner: cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .userName
                                                    .toString(),
                                                ImageDoctor: cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .image
                                                    .toString(),
                                                idChat: cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .ids,
                                              ),
                                            ),
                                          ); // Navigate to chat screen for selected conversation
                                        },
                                      );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}

class ShimmerWidght extends StatelessWidget {
  const ShimmerWidght({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ShimerWidght(
        width: width * 0.16,
        height: height * 0.2,
        reduis: 50,
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 30, bottom: 6),
        child: ShimerWidght(
          width: width * 0.02,
          height: height * 0.03,
        ),
      ),
      subtitle: ShimerWidght(
        width: width * 0.02,
        height: height * 0.03,
      ),
      trailing: Column(
        children: [
          ShimerWidght(
            width: width * 0.14,
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.004,
          ),
          ShimerWidght(
            width: width * 0.09,
            height: height * 0.04,
            reduis: 50,
          ),
        ],
      ),
    );
  }
}
