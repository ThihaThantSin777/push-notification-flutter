import 'package:flutter/material.dart';
import 'package:noti_test/pages/details_page.dart';
import 'package:noti_test/pages/home_page.dart';
import 'package:noti_test/pages/index_page.dart';
import 'package:noti_test/pages/setting_page.dart';

class NotificationRoute {
  static void route(String type) {
    if (type == PageType.homePage.name) {
      MyApp.navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const HomePage()));
    } else if (type == PageType.detailsPage.name) {
      MyApp.navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const DetailsPage()));
    } else if (type == PageType.settingPage.name) {
      MyApp.navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const SettingPage()));
    }
  }
}

enum PageType { homePage, detailsPage, settingPage }
