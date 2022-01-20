import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/Authetication/login_page.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/model/auth%20service/autheticationService.dart';
import 'package:second_shopp/model/data/notification_dao.dart';
import 'package:second_shopp/model/data/registration_dao.dart';
import 'package:second_shopp/model/data/report_dao.dart';
import 'package:second_shopp/model/data/sell_dao.dart';
import 'package:second_shopp/model/data/transaction_dao.dart';
import 'package:second_shopp/theme_data.dart';
import 'page_layout.dart';
import 'model/tab_manager.dart';
import 'globals.dart' as globals;
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// notification channel : sound and importance
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);
// local notification plugin instance
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
// firebase messaging remote message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
  globals.newNotifications = true;
  if (message.messageId != null) {}
}

Future<void> main() async {
  // firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// firebase notification handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(SecondShop());
}

class SecondShop extends StatelessWidget {
  SecondShop({Key? key}) : super(key: key);

// application theme color
  final theme = SecondShopTheme.light();

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // CHeck for Errors
          if (snapshot.hasError) {
            print("Something went Wrong");
          }
          // once Completed, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                //provider with the changenotifier for managing tabs
                ChangeNotifierProvider(create: (context) => TabManager()),
                // providers of various Data Access Objects
                Provider(create: (_) => Sell_Dao()),
                Provider(create: (_) => Registration_Dao()),
                Provider(create: (_) => Transaction_Dao()),
                Provider(create: (_) => Notification_Dao()),
                Provider(create: (_) => Report_Dao()),
                Provider(create: (_) => CartItems()),
                // provider for the authentication
                Provider<AuthenticationService>(
                  create: (_) => AuthenticationService(FirebaseAuth.instance),
                ),
                // stream provider for the user authentication
                StreamProvider(
                  create: (context) =>
                      context.read<AuthenticationService>().authStateChanges,
                  initialData: null,
                )
              ],
              child: MaterialApp(
                  theme: theme,
                  // animated splace screen
                  home: AnimatedSplashScreen(
                      splash: Column(
                        children: [
                          Container(
                            width: 40,
                            // height: 10,
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                          ),
                          const Text(
                            'Second Shop',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 35),
                          )
                        ],
                      ),
                      duration: 1000,
                      backgroundColor: Colors.orange.shade400,
                      splashTransition: SplashTransition.fadeTransition,
                      nextScreen: AuthenticationWrapper())
                  // home: AuthenticationWrapper(),
                  ),
            );
          }

          return CircularProgressIndicator();
        });
  }
}

// user authetication : listens for user's token
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    // if usertoken is available
    if (firebaseUser != null) {
      return PageLayout();
    }
    // if usertoken not found
    return LoginPage();
  }
}
