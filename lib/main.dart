import 'package:cloud_walk_test/app/cloud_application.dart';
import 'package:cloud_walk_test/di/app_di.dart';
import 'package:cloud_walk_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    initServices(),
  ]);
  runApp(const CloudWalkApplication());
}

Future<void> initServices() async {
  // Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // End Firebase

  // DI
  await AppDI.setupDI();
  // End Di
}