import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/main/main_screen.dart';
import 'package:price_list_pro/provider/user_provider.dart';
import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:price_list_pro/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => WareProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: const Color(0XFFf5f5f5)),
      onGenerateRoute: (setting) => generateRoute(setting),
      home: const MainScreen(),
    );
  }
}
