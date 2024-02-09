import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, deivceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pill Reminder',
        theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldColor,
          appBarTheme: const AppBarTheme(
              toolbarHeight: 50,
              backgroundColor: kScaffoldColor,
              elevation: 0,
              iconTheme: IconThemeData(
                color: kSecondaryColor,
                size: 28,
              ),
              titleTextStyle: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 16,
              )),
          textTheme: TextTheme(
              headline3: TextStyle(
                fontSize: 28.sp,
                color: kSecondaryColor,
                fontWeight: FontWeight.w400,
              ),
              headline4: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w900,
                color: kTextColor,
              ),
              headline6: TextStyle(
                fontSize: 28.sp,
                color: kTextColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
              subtitle2: TextStyle(fontSize: 12.sp, color: kTextColor),
              labelMedium: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              )),
        ),
        home: const HomePage(),
      );
    });
  }
}
