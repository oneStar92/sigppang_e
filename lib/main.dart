import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return MaterialApp(
          title: 'SigPpangE',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Suite',
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              toolbarHeight: 50,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: Container(),
    );
  }
}