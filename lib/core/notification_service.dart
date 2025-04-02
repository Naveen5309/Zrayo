import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zrayo_flutter/config/helper.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  await NotificationService().displayNotification(message.toMap());
}

class NotificationService {
  Future<void> initializeFcm() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    bool? initialize = await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    printLog("initializeFcm()=> $initialize");
    // printLog("get fcm Token()=> ${await getFcmToken()}");
  }

  Future<void> initPushNotificationListeners() async {
    try {
      /// Check if permission has already been granted
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission();

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        /// Set up background message handler
        FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

        /// Handle initial message when the app is terminated
        FirebaseMessaging.instance.getInitialMessage().then((remoteMessage) {
          if (remoteMessage != null) {
            initPushNotificationListenersOnMessage(remoteMessage);
          }
        });

        /// Handle message when the app is in the foreground
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          if (message.notification != null) {
            /// Handle foreground messages
            initPushNotificationListenersOnMessage(message);
          }
        });

        /// Handle message when the app is in the background and not terminated
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          if (message.notification != null) {
            /// Handle background messages
            initPushNotificationListenersOnMessage(message);
          }
        });
      } else {
        printLog('🙁 NotificationPermission denied by user 🙁');
      }
    } catch (e, stackTrace) {
      functionLog(
          msg: '🙁 Error initializing push notification listeners: $e 🙁',
          fun: "initPushNotificationListeners");
      functionLog(msg: stackTrace, fun: "initPushNotificationListeners");
    }
  }

  void initPushNotificationListenersOnMessage(RemoteMessage event) {
    displayNotification(event.toMap());
  }

  /// Function to Notification Show.
  Future displayNotification(Map<String, dynamic> message) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'default_notification_channel_id',
      'Zrayo',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    printLog("displayNotification==> $message");
    // final notificationType = (message['data']["notificationtype"] ??
    //         message['data']["NotificationType"])
    //     .toString();

    await notificationsPlugin.show(
      0,
      message['notification']['title'],
      message['notification']['body'],
      platformChannelSpecifics,
      payload: jsonEncode(message['data']),
    );
  }

  /// when app is open
  void onDidReceiveNotificationResponse(NotificationResponse details) {
    try {
      printLog("onDidReceiveNotificationResponse====>${details.payload}");

      // final notificationData = jsonDecode(details.payload ?? "");
      // final notificationType = (notificationData["notificationtype"] ??
      //         notificationData["NotificationType"])
      //     .toString();

      // goToNotificationScreen();
    } on Exception catch (e, t) {
      functionLog(msg: e, fun: "onDidReceiveNotificationResponse");
      functionLog(msg: t.toString(), fun: "onDidReceiveNotificationResponse");
    }
  }
//
// void goToNotificationScreen() {
//   if (Getters.isCustomer()) {
//     if (Get.currentRoute != NotificationsScreen.notifications) {
//       Get.toNamed(NotificationsScreen.notifications);
//     }
//   } else {
//     final bottomNavController = Get.find<BottomNavController>();
//     if (Get.currentRoute != MainBottomNavView.mainBottomNav) {
//       bottomNavController
//           .changeTabIndex(BusinessBottomBarScreens.notification.index);
//       Get.offAndToNamed(MainBottomNavView.mainBottomNav);
//     } else if (Get.currentRoute == MainBottomNavView.mainBottomNav &&
//         bottomNavController.currentIndex.value !=
//             BusinessBottomBarScreens.notification.index) {
//       bottomNavController
//           .changeTabIndex(BusinessBottomBarScreens.notification.index);
//     }
//   }
// }
}
