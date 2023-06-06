import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/route.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.navigatorKey,
      title: "Notification Test",
      home: const IndexPage(),
    );
  }
}

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPreferences.getInstance().then((prefs) {
        final data = prefs.getString('notification');
        if (data != null && data.isNotEmpty) {
          NotificationRoute.route(data);
          prefs.setString('notification', "");
        }
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Index Page"),
      ),
      body: const Center(
        child: Text('This is Index Page'),
      ),
    );
  }
}
