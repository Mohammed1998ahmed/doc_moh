
 
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

void onEvent1(dynamic event) {
  print("onEv ent: $event");
  
}

dynamic onError(String message, int? code, dynamic e) {
  print("onError: $message code: $code exception: $e");
}

dynamic onConnectionStateChange(dynamic currentState, dynamic previousState) {
  print("Connectio n: $currentState");
}

dynamic onMemberRemoved(String channelName, PusherMember member) {
  print("onMemberRemoved: $channelName member: $member");
}

dynamic onMemberAdded(String channelName, PusherMember member) {
  print("onMemberAdded: $channelName member: $member");
}

dynamic onSubscriptionSucceeded(String channelName, dynamic data) {
  print("onSubscriptionSucceeded: $channelName data: $data");
}

dynamic onSubscriptionError(String message, dynamic e) {
  print("onSubscriptionError: $message Exception: $e");
}

dynamic onEvent(PusherEvent event) {
  print("onE    ven  t: $event");

  // event.eventName = "mohammed";
  // Provider.of<NotificationProvider>(context, listen: false)
  //     .setNotificationCount(1);
}

dynamic onDecryptionFailure(String event, String reason) {
  print("onDecryptionFailure: $event reason: $reason");
}