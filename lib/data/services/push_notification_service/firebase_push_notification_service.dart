import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';

class FirebasePushNotificationService {
  static final Logger _logger = Logger();

  static final FirebasePushNotificationService
      _firebasePushNotificationService = FirebasePushNotificationService();

  static FirebasePushNotificationService get instance =>
      _firebasePushNotificationService;

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description,
    importance: Importance.max,
  );

  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  ///Firebase Push Notification
  static Future<void> initializeNotification({
    required String userTopic,
  }) async {
    // Initializing Channels
    await initializeChannels();

    String str = userTopic.toLowerCase();
    String topic = str.replaceAll(RegExp('[^A-Za-z0-9]'), '');
    // var topic = rawTopic;

    _logger.i("beforeTopic: $topic");

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      // Notification Center
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _logger.i('User granted permission: ${settings.authorizationStatus}');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      _logger.i('User granted provisional permission');
    } else {
      _logger.i('User declined or has not accepted permission');
    }

    // subscribe to topic on each app start-up
    await FirebaseMessaging.instance.subscribeToTopic(topic).then((value) {
      _logger.i("TOPIC: $topic subscribe successful");
    });

    //Android
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.requestPermission();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //iOS
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      _logger.i(
          "onMessageRemote: ${message.notification?.title}, ${message.messageId}, ${message.messageType}");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      await FlutterAppBadger.updateBadgeCount(1);

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            iOS: const DarwinNotificationDetails(
              presentBadge: true,
              presentAlert: true,
              presentSound: true,
            ),
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                icon: "@mipmap/launcher_icon" //android.smallIcon,
                ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      _logger.i("onMessageOpenedApp: ${event.data}");
      await FlutterAppBadger.removeBadge();
    });
  }

  static Future<void> initializeChannels() async {
    _logger.i("initializing channels...");
    // tz.initializeTimeZones();

    /// Android Initialization Setting
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings(
      '@mipmap/launcher_icon',
    );

    /// iOS Initialization Setting
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    /// Settings
    const InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsDarwin,
    );

    /// Local Notification Service
    await flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
        // onSelectNotification: onSelectNotification,
        );
  }

  static void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    _logger.i(
        "onDidReceiveNotificationResponse ${notificationResponse.notificationResponseType.name}");
  }

  /// On Select Notification
  static void onSelectNotification(String? payload) {
    _logger.i("onSelectNotificationPayload: $payload");
  }

  /// on Did Receive Local Notification
  static void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    _logger.i("id: $id, title: $title, body: $body, payload: $payload");
    // await _showNotification(
    //   id: id,
    //   title: title ?? "Title",
    //   body: body ?? "Body",
    // );
  }

  /// Unsubscribe From Topic
  static Future<void> unsubscribeFromTopic({required String email}) async {
    String str = email.toLowerCase();
    String userEmail = str.replaceAll(RegExp('[^A-Za-z0-9]'), '');
    _logger.d("UserEmail for topic:$userEmail");
    // subscribe to topic on each app start-up
    await FirebaseMessaging.instance.unsubscribeFromTopic(email).then((value) {
      _logger.d("TOPIC: Unsubscribe successful");
    }).onError((error, stackTrace) {
      _logger.d("TOPICError: Unsubscribe successful");
    });
  }

  /// Topic based Push Notification from Device to Device
// static Future<bool> callOnFcmApiSendPushNotifications({
//   required String title,
//   required String body,
//   required String userSubscribedTopic,
// }) async {
//   const postUrl = 'https://fcm.googleapis.com/fcm/send';
//   final data = {
//     "to": "/topics/$userSubscribedTopic",
//     "notification": {
//       "title": title,
//       "body": body,
//     },
//     "data": {
//       "type": 'chat',
//       "id": '0',
//       "click_action": 'FLUTTER_NOTIFICATION_CLICK',
//     }
//   };
//
//   debugPrint("bodyData: $data");
//
//   // Use FCM key
//   var key =
//       "AAAAybEwsXQ:APA91bHutPuRRBQTNBgjQCelA0ZeY4EViTx2TfcZBD8pnnpZjJz83HZ-cJvwR8BaO4G7P48CZ5FNe7VaipJOHKDeZjMQrze_MFZ6Yc7G0DVoMj9Zeyl8El2YdMPb5_XqtKwR4KCI8xNO";
//   final headers = {
//     'content-type': 'application/json',
//     'Authorization': 'key=$key'
//     // 'key=YOUR_SERVER_KEY'
//   };
//
//   debugPrint("headers: $headers");
//
//   final response = await http.post(Uri.parse(postUrl),
//       body: json.encode(data),
//       encoding: Encoding.getByName('utf-8'),
//       headers: headers);
//
//   if (response.statusCode == 200) {
//     // on success do sth
//     debugPrint('TopicBaseFCM: Test okay push CFM');
//     return true;
//   } else {
//     debugPrint('TopicBaseFCM: CFM Error');
//     // on failure do sth
//     return false;
//   }
// }
}
