import 'package:clot_app/bloc_observer.dart';
import 'package:clot_app/clot_app.dart';
import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/core/routing/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  runApp(ClotApp(appRouter: AppRouter()));
}
