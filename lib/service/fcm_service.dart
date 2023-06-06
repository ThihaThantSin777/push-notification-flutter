import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification_scheduler.dart';

class FcmService {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void init() async {
    firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);

    ///Token Generate
    firebaseMessaging.getToken().then((token) {
      debugPrint("FCMToken =======> $token");
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await showNotification(message.data);
    });

    //Handle Background and Terminate
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await showNotification(message.data);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("notification", message.data['noti_type']);
  }

  static Future<void> showNotification(Map<String, dynamic> data) async {
    NotificationScheduler().displayNotification(
      data['title'],
      data['body'],
      data['noti_type'],
      data['image'],
    );
  }
}
