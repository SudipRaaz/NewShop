import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/screen/category_page.dart';

import 'package:second_shopp/screen/home_page.dart';
import 'package:second_shopp/screen/notification_page.dart';
import 'package:second_shopp/screen/profile.dart';
import 'package:second_shopp/screen/sell.dart';

import 'model/tab_manager.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({Key? key}) : super(key: key);

  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  List pages = <Widget>[
    Home(),
    Category(),
    Sell(),
    Notification_page(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
          body: pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
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
                icon: const Icon(Icons.category),
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
