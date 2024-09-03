import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:posts_app/core/log.dart';
import 'package:posts_app/main.dart';

class NotificationsHelper {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static late NotificationAppLaunchDetails? notificationDetails;
  static late BuildContext? mBuildContext;

  static Future<void> init() async {
    await firebaseMessaging.setAutoInitEnabled(true);
    final settings = await firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      Log.information('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      Log.information('User granted provisional permission');
    } else {
      Log.information('User declined or has not accepted permission');
    }
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    ); // @mipmap/ic_launcher @drawable/notification_logo
    const initializationSettingsDarwin = DarwinInitializationSettings(
      requestCriticalPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
          critical: true,
        );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationTapBackground,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    notificationDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationDetails?.didNotificationLaunchApp == true) {
      final details = notificationDetails!.notificationResponse!;
      notificationTapBackground(details);
      Log.information('didNotificationLaunchApp ${details.payload}');
    }
  }

  void registerNotification(BuildContext context) {
    mBuildContext = context;
    firebaseMessaging
      ..requestPermission(
        announcement: true,
        criticalAlert: true,
        provisional: true,
      )
      ..setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

    firebaseMessaging.onTokenRefresh.listen((String token) async {
      // await getIt<SetFcmTokenUseCase>()
      //     .call({'fcmToken': await NotificationsHelper.getToken()});
    });

    firebaseMessaging.getInitialMessage().then((message) {
      // if (message?.data['module_type'] != null) {
      //   AppRouter().onNotificationClicked(
      //       context, message?.data['module_type'], message?.data['module_id']);
      // }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //Do some stuff here
      await showNotifications(message);
      //    if (message.data['module_type'] != null) {
      //     await AppRouter().onNotificationClicked(
      //      context, message.data['module_type'], message.data['module_id']);
      // }
      Log.information('onMessage ${message.toMap()}');
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      //Do some stuff here
      await showNotifications(message);
      //    if (message.data['module_type'] != null) {
      //     await AppRouter().onNotificationClicked(
      //      context, message.data['module_type'], message.data['module_id']);
      // }
      Log.information('onBackgroundMessage ${message.toMap()}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      //Do some stuff here
      await showNotifications(message);
      //    if (message.data['module_type'] != null) {
      //     await AppRouter().onNotificationClicked(
      //      context, message.data['module_type'], message.data['module_id']);
      // }
    });
  }

  static Future<String?> getToken() async {
    final token = await firebaseMessaging.getToken();
    final apnsToken = await firebaseMessaging.getAPNSToken();
    Log.information('FCM userToken $token , apnsToken $apnsToken');
    return token;
  }

  static Future<bool> checkNotificationPermission() async {
    final settings = await firebaseMessaging.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> showNotifications(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;
    if (notification != null && android != null) {
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'my_channel_id', //must be matches the channel in android manifest
            'appName',
            channelDescription: 'general channel for notifications',
            importance: Importance.high,
            priority: Platform.isIOS ? Priority.defaultPriority : Priority.high,
          ),
        ),
        payload: message.toMap().toString(),
      );
    }
  }

  static Future<void> onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    Log.information(
      'onDidReceiveLocalNotification $id, $title, $body, $payload',
    );
  }
}
