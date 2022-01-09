import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/main.dart';
import 'package:second_shopp/screen/category_page.dart';

import 'package:second_shopp/screen/home_page.dart';
import 'package:second_shopp/screen/notification_page.dart';
import 'package:second_shopp/screen/profile.dart';
import 'package:second_shopp/screen/sell.dart';
import 'model/tab_manager.dart';
import 'globals.dart' as globals;

class PageLayout extends StatelessWidget {
  PageLayout({
    Key? key,
  }) : super(key: key);

  List pages = <Widget>[
    Home(),
    Category(),
    Sell(),
    Notification_page(),
    Profile(),
  ];

  bool checkForNotification = false;
  int _counter = 0;

  @override
  void initState() {
    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      await Firebase.initializeApp();
      if (message.messageId != null) {
        globals.newNotifications = true;
      }
      print('A bg message just showed up :  ${message.messageId}');
    }

    // TODO: implement initState
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      checkForNotification = true;
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                // channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
        checkForNotification = true;
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      checkForNotification = true;
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        checkForNotification = true;
      }
      if (notification != null) {
        // checkForNotication = true;
      }
    });
  }

  // void showNotification() {
  //   setState(() {
  //     _counter++;
  //   });
  //   flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Testing $_counter",
  //       "How you doin ?",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name,
  //               importance: Importance.high,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher')));
  // }

  @override
  Widget build(BuildContext context) {
    print('notification status: ${globals.newNotifications}');
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
          body: (globals.newNotifications)
              ? pages[3]
              : pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: (globals.newNotifications)
                ? tabManager.selectedTab = 3
                : tabManager.selectedTab,
            // tabManager.selectedTab = 1,
            onTap: (index) {
              globals.newNotifications = false;
              tabManager.goToTab(index);
            },
            fixedColor: Colors.black,
            backgroundColor: Colors.black45,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.orange.shade400,
                icon: const Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.orange.shade400,
                icon: const Icon(Icons.dashboard_rounded),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.orange.shade400,
                icon: const Icon(Icons.add),
                label: 'Sell',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.orange.shade400,
                icon: const Icon(Icons.notifications),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.orange.shade400,
                icon: const Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ));
    });
  }
}
