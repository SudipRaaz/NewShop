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

// list of all the main pages to be accessed from the bottom navigation
  List pages = <Widget>[
    Home(),
    Category(),
    Sell(),
    Notification_page(),
    Profile(),
  ];

  bool checkForNotification = false; // check for new notification
  int _counter = 0; // count the number of notification

  @override
  void initState() {
    // firebase messaging for the background notifications
    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      await Firebase.initializeApp();
      if (message.messageId != null) {
        globals.newNotifications = true;
      }
    }

    // TODO: implement initState and listen for remote notification
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
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
        checkForNotification = true;
      }
    });
// TODO: implement initState and listen for remote notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      checkForNotification = true;
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        checkForNotification = true;
      }
      if (notification != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    // consumer of tabmanger
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
          body: (globals.newNotifications)
              ? pages[3]
              : pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: (globals.newNotifications)
                ? tabManager.selectedTab = 3
                : tabManager.selectedTab,
            //change the body based on the index of the bottom navigation tap
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
