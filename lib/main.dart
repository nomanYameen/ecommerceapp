import 'package:ecommerce/home.dart';
import 'package:ecommerce/provider/otp_method_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'screens/home_category_screen.dart';
import 'screens/phone.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en','ar']);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> OtpCheckProvider()),
      ],
      child:  LocaleBuilder(
        builder: (locale)=>MaterialApp(
          // title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
          theme: ThemeData(
              fontFamily: "Lato-Regular"
            // primarySwatch: Colors.blue,
          ),
          // home: PhoneNumber(),
          // home: HomeCategoryScreen(),
          // home: Home(),
          ///used current screen data
          home: const PhoneNumber(),
          // home:const Home(),
        ),
      ),
    );
  }
}
flutterToast({required String message})async{
 await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
