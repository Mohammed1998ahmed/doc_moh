import 'package:flutter/material.dart';

// import 'package:flutter_share/flutter_share.dart';
// final Color0 = Color.fromARGB(255, 238, 128, 54);
// final Color0 = Color.fromARGB(255, 255, 199, 99);
final Color0 = Color.fromARGB(255,71, 181,255);

final ColorNaf = Colors.green;

final Color1 = const Color.fromRGBO(90, 0, 114, 1);
final Color2 = const Color.fromRGBO(0, 0, 0, 1);

final Color3 = const Color.fromRGBO(255, 255, 255, 1);
final Color4 = const Color.fromRGBO(0, 0, 0, 0.7);
final Color5 = Colors.grey;
final Color6 = Color.fromRGBO(35, 0, 44, 1);
final Color7 = Color.fromRGBO(155, 151, 151, 1);
final Color8 = Color.fromRGBO(190, 140, 206, 0.5);
final Color9 = Color.fromRGBO(0, 0, 0, 0.87);
final Color10 = Color.fromRGBO(90, 0, 114, 0.4);
final LinearGradientColor01 = Color.fromRGBO(255, 199, 39, 1);

final LinearGradientColor02 = Color.fromRGBO(255, 215, 105, 1);

final LinearGradientColor03 = Color.fromRGBO(255, 255, 155, 1);

final LinearGradientColor1 = Color.fromRGBO(120, 73, 133, 1);
final LinearGradientColor2 = Color.fromRGBO(139, 111, 147, 1);
final LinearGradientColor3 = Color.fromRGBO(255, 255, 255, 1);
final ColorLine1 = const Color.fromRGBO(90, 0, 114, 1);

final ColorLine2 = Color.fromRGBO(204, 167, 106, 1);
String imageBackground = 'assets/images/images (6).png';

///onBording
class DefuiltContainar extends StatelessWidget {
  const DefuiltContainar({
    Key? key,
    this.color,
    this.nameimage,
    this.title,
    this.subtite,
  }) : super(key: key);
  final Color? color;
  final String? nameimage;
  final String? title;
  final String? subtite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color ?? Colors.pinkAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 350,
                height: 450,
                // clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage(nameimage.toString()),
                        fit: BoxFit.fill)),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

final pages = [
  DefuiltContainar(
      title: "mohammed ahmed ",
      color: Colors.yellowAccent,
      nameimage: 'assets/images/Health professional team-cuate.png'),
  DefuiltContainar(
      color: Colors.orange, nameimage: 'assets/images/Medicine-amico.png'),
  DefuiltContainar(
      color: Colors.red, nameimage: 'assets/images/Medicine-bro.png'),
];
///////end onBording
///
///
///
///star Home

class Conversation {
  final String name;
  final String message;
  final String image;
  final double unreadMessages;
  final String messageTime;
  // حقل لتخزين وقت إرسال الرسالة

  Conversation({
    required this.name,
    required this.message,
    required this.image,
    required this.unreadMessages,
    required this.messageTime,
  });
}

final List<Conversation> conversations = [
  Conversation(
    name: 'mohammed',
    message: 'The service of this stable was beautiful ….',
    image:
        'assets/images/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg',
    unreadMessages: 0,
    messageTime: "2 hours ago", // تعيين وقت إرسال الرسالة هنا
  ),
  Conversation(
    name: 'Omar',
    message: 'The service of this stable was beautiful ….',
    image: 'assets/images/james-person-1.jpg',
    unreadMessages: 3,
    messageTime: "3 months ago", // تعيين وقت إرسال الرسالة هنا
  ),
  Conversation(
    name: 'Dani',
    message: 'The service of this stable was beautiful….',
    image: 'assets/images/Person.jpg',
    unreadMessages: 2,
    messageTime: "1 months ago", // تعيين وقت إرسال الرسالة هنا
  ),
  Conversation(
    name: 'mohammed',
    message: 'The service of this stable was beautiful ….',
    image:
        'assets/images/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg',
    unreadMessages: 0,
    messageTime: "2 hours ago", // تعيين وقت إرسال الرسالة هنا
  ),
  Conversation(
    name: 'mohammed',
    message: 'The service of this stable was beautiful ….',
    image:
        'assets/images/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg',
    unreadMessages: 0,
    messageTime: "2 hours ago", // تعيين وقت إرسال الرسالة هنا
  ),
  Conversation(
    name: 'mohammed',
    message: 'The service of this stable was beautiful ….',
    image:
        'assets/images/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg',
    unreadMessages: 0,
    messageTime: "2 hours ago", // تعيين وقت إرسال الرسالة هنا
  ),
  Conversation(
    name: 'mohammed',
    message: 'The service of this stable was beautiful ….',
    image:
        'assets/images/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg',
    unreadMessages: 0,
    messageTime: "2 hours ago", // تعيين وقت إرسال الرسالة هنا
  ),
  // Add more conversations as needed
];
final List<String> imageUrls = [
  'assets/images/main/image 82.png',
  'assets/images/main/image 83.png',
  'assets/images/main/image 84.png',
  'assets/images/main/image 85.png',
  'assets/images/main/image 82.png',
  'assets/images/main/image 83.png',
  'assets/images/main/image 84.png',
  'assets/images/main/image 85.png',
];
// Future<void> share() async {
//   await FlutterShare.share(
//       title: 'Example share',
//       text: 'Example share text',
//       linkUrl: 'https://flutter.dev/',
//       chooserTitle: 'Example Chooser Title');
// }

double rating = 0.0;
double rating1 = 0.0;

String? selectedOption;
String? selectedOption1;

String? selectedOption2;

bool secrbool = true;
bool secrbool1 = true;
bool secrbool2 = true;

String ImagesPath = 'http://auction.techno-systems.online/';
String ImagesPath1 = 'http://auction.techno-systems.online/';

Map<int, bool> reviewRaiting = {};

  // Future<void> shareFile() async {
  //   List<dynamic> docs = await DocumentsPicker.pickDocuments;
  //   if (docs == null || docs.isEmpty) return null;

  //   await FlutterShare.shareFile(
  //     title: 'Example share',
  //     text: 'Example share text',
  //     filePath: docs[0] as String,
  //   );
  // }

