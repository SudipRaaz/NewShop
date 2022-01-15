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

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
  globals.newNotifications = true;
  if (message.messageId != null) {}
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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

  final theme = SecondShopTheme.light();

  // In this snippet, I'm giving a value to all parameters.
// Please note that not all are required (those that are required are marked with the @required annotation).

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
                ChangeNotifierProvider(create: (context) => TabManager()),
                Provider(create: (_) => Sell_Dao()),
                Provider(create: (_) => Registration_Dao()),
                Provider(create: (_) => Transaction_Dao()),
                Provider(create: (_) => Notification_Dao()),
                Provider(create: (_) => Report_Dao()),
                Provider(create: (_) => CartItems()),
                // for the authentication
                Provider<AuthenticationService>(
                  create: (_) => AuthenticationService(FirebaseAuth.instance),
                ),
                StreamProvider(
                  create: (context) =>
                      context.read<AuthenticationService>().authStateChanges,
                  initialData: null,
                )
              ],
              child: MaterialApp(
                  theme: theme,
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
                          Text(
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

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return PageLayout();
    }
    return LoginPage();
  }
}
