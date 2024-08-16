import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseApp {
  final _firebaseMessages = FirebaseMessaging.instance;

  Future<void> initFirebaseNotifications() async {
    await _firebaseMessages.requestPermission();
    final fcmToken = await _firebaseMessages.getToken();
    print("Token: $fcmToken");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message:");
      print("Notification title: ${message.notification?.title}");
      print("Notification body: ${message.notification?.body}");
      // قم بتنفيذ الإجراءات الخاصة بك هنا عند استلام الرسالة
    });
  }
}