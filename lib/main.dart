import 'package:flutter/material.dart';
import 'package:push_notifications/pages/home_screen.dart';
import 'package:push_notifications/pages/message_screen.dart';
import 'package:push_notifications/services/push_notification_services.dart';

void main() async{

  //Actua para tener listo un context antes de cargar los demás widgets
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
    void initState() {
      super.initState();

      PushNotificationService.messageStream.listen((message) {
        print('MyApp: $message');
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Material App',
     initialRoute: 'home',
     routes: {
       'home': (_) => HomeScreen(),
       'message': (_) => MessageScreen()
     },
    );
  }
}
