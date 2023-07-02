import 'package:firebase_app/auth.dart';
import 'package:firebase_app/loginpage.dart';
import 'package:firebase_app/splash.dart';
import 'package:firebase_app/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  //waiting for binding from firebase and authentication controller
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController(), permanent: true));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        initialRoute: '/login',
        getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
          GetPage(name: '/welcome', page: () => WelcomePage(email: '',)),],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Provide AuthController globally
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const SplashScreen(),
    );
  }
}

