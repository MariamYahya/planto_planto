import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planto_planto/core/application_theme.dart';
import 'package:planto_planto/dashboard/dashboard_view.dart';
import 'package:planto_planto/home/home_view.dart';
import 'package:planto_planto/login/login_view.dart';
import 'package:planto_planto/registration/registeration.dart';
import 'package:planto_planto/splash/splash_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void dispose() {
    user.cancel();
    super.dispose();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      theme: ApplicationTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        SplashView.routeName : (context) => SplashView(),
        HomeView.routeName : (context) => HomeView(),
        LoginView.routeName : (context) => LoginView(),
        DashboardView.routeName : (context) => DashboardView(),
        RegistrationView.routName : (context) => RegistrationView(),
      },
    );
  }
}

