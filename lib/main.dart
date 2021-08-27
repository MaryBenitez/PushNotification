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

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
    void initState() {
      super.initState();

      PushNotificationService.messageStream.listen((message) {
        print('MyApp: $message');

        navigatorKey.currentState?.pushNamed('message', arguments: message);

        final snackBar = SnackBar(content: Text(message));
        messengerKey.currentState?.showSnackBar(snackBar);
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Material App',
     initialRoute: 'home',
     navigatorKey: navigatorKey, //Navegar
     scaffoldMessengerKey: messengerKey, //Snacks
     routes: {
       'home': (_) => HomeScreen(),
       'message': (_) => MessageScreen()
     },
    );
  }
}
