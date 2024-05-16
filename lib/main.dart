import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/di/injector.dart';
import 'package:posts_app/core/log.dart';
import 'package:posts_app/core/notifications_helper.dart';
import 'package:posts_app/layers/data/source/local/hive_manager.dart';
import 'package:posts_app/layers/presentation/base/app_root.dart';
import 'package:posts_app/layers/presentation/base/bloc_observer.dart';
import 'package:posts_app/resources/langauge_manager.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //Todo
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Log.information('_firebaseMessagingBackgroundHandler $message');
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  final data = jsonDecode(notificationResponse.payload!);

  Log.information('mRemoteMessage $data');

  final message =
      RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
  Log.information('mRemoteMessage ${message.data}');
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.data.containsKey('link')) {
    // Extract the deep link from the FCM message
    final deepLink = message.data['link'];

    // Handle the deep link
    // await handleDynamicLink(Uri.parse(deepLink));
  }
}

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();
  await HiveManager.instance.initialize();

  await initializeGetIt();
  await NotificationsHelper.init();
  Bloc.observer = MyBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  Animate.restartOnHotReload = true;

  await ScreenUtil.ensureScreenSize();

  runApp(
    EasyLocalization(
      supportedLocales: const [arLocale, enLocale],
      path: localeAssetsPath,
      startLocale: enLocale,
      fallbackLocale: enLocale,
      child: const AppRoot(),
    ),
  );

  FlutterNativeSplash.remove();
}
