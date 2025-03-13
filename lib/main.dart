import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_cleanarch/core/appStyle.dart';
import 'package:news_cleanarch/ui/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'NewsCl',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppStyle.lightTheme,
          routes: {HomeScreen.routeName: (_) => HomeScreen()},
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
