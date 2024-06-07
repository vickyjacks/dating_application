import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationsService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print('permission granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // print('provisional permission granted');
    } else {

      // print('permission denied');
    }
  }

  Future<String> getDeviceToken() async {
    String? deviceToken = await messaging.getToken();
    if (deviceToken != null) {
      return deviceToken;
    } else {
      return 'UserDeniedPermission';
    }
  }

  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    //!
    var androidInitializationSettings =
    const AndroidInitializationSettings('@drawable/logos');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payLoad) {
        handleMessage(context, message);
      },
    );
  }

  Future showNotification(RemoteMessage message) async {
    //!
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'High Importance Notification',
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        channel.id.toString(), channel.name.toString(),
        channelDescription: 'Your channel description',
        importance: Importance.high,
        priority: Priority.high,
        icon: 'logos',
        ticker: 'ticker');

    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  void firebaseNotificationInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      //!
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        // print(message.data.toString());
        // print(message.data['type']);
        // print(message.data['id']);
      }
      if (Platform.isAndroid) {
        initLocalNotification(context, message);
      }
      showNotification(message);
      // print("+++++++++line num 112 ${message.data}");
      // print("+++++++++line num 133 ${message.data["room_id"]}");
      if (message.notification!.body == 'Calling You') {

      }
    });
  }

  //!
  Future<void> setUpInterectMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null && context.mounted) {
      handleMessage(context, initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //
      handleMessage(context, event);
    });
  }


  void handleMessage(BuildContext context, RemoteMessage message) async {
    if (message.notification!.body == 'Calling You') {

      }
  }
}