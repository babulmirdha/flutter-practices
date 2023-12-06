import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/login_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initLocalNotification();

  runApp(MyApp());
}

void configureFirebaseMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request permission for notifications
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  print("User granted permission: ${settings.authorizationStatus}");

  // Retrieve the device token
  String? token = await messaging.getToken();
  print("Token: $token");

  // Subscribe to a topic
  messaging.subscribeToTopic('flutter_batch_01');

  // Configure message handlers
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Received message: ${message.notification?.title}");
    // Handle the incoming message
    showNotification(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("App opened by message: $message");
    // Handle the message when the app is opened from the background
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling background message: $message");
  // Handle the background message
}

Future<void> initLocalNotification() async {
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = const DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await FlutterLocalNotificationsPlugin().initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse? paylod) async {

    },
  );
}

Future<void> showNotification(RemoteMessage message) async {
// Add your own logic to display a notification
// For example, using the flutter_local_notifications package
// https://pub.dev/packages/flutter_local_notifications

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'firebase_demo',
    'my_channel',
    importance: Importance.max,
    priority: Priority.high,
  );

// var iOSPlatformChannelSpecifics = IOSNotificationDetails();

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
// iOS: iOSPlatformChannelSpecifics,
  );

  await FlutterLocalNotificationsPlugin().show(
    0, // notification id
    message.notification?.title ?? 'Notification Title',
    message.notification?.body ?? 'Notification Body',
    platformChannelSpecifics,
    payload: 'item x',
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    configureFirebaseMessaging();

    return MaterialApp(
      home: LoginPage(),
// home: UserListUsingStreamPage(),
    );
  }
}
