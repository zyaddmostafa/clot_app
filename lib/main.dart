import 'package:clot_app/clot_app.dart';
import 'package:clot_app/core/routing/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ClotApp(appRouter: AppRouter()));
}
