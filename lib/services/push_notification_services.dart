//A3:8C:D0:67:2D:D9:13:19:58:3A:31:CF:D3:B2:21:F8:97:93:34:E3

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token; // ? -- Opcional

  static Future initializeApp() async {
    //push notification
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token: $token');

    //local notification
  }

}