//A3:8C:D0:67:2D:D9:13:19:58:3A:31:CF:D3:B2:21:F8:97:93:34:E3

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token; // ? -- Opcional

  static StreamController<String> _messageStream = new StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    //print('onBackgroundHandler ${message.messageId}');
    print(message.data);
    //                 -- Sino viene o pasa algo (?) entonces(??)
    _messageStream.add(message.notification?.body ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //print('onMessageHandler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.body ?? 'No title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print('onMessageOpenApp ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.body ?? 'No title');
  }

  static Future initializeApp() async {
    //push notification
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //local notification
  }

  static closeStreams(){
    _messageStream.close();
  }

}