import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/di/router.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko');
  await Firebase.initializeApp();
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
        return MaterialApp.router(
          routerConfig: router,
          title: '식빵이',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Suite',
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              toolbarHeight: Sizes.appBarHeight,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
