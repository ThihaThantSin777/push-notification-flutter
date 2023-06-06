import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noti_test/pages/index_page.dart';
import 'package:noti_test/service/fcm_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FcmService().init();
  runApp(const MyApp());
}
