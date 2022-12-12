import 'package:flutter/material.dart';
import 'package:price_list_pro/features/add/add_customer/add_customer_screen.dart';
import 'package:price_list_pro/features/add/add_ware/add_ware_screen.dart';

import 'package:price_list_pro/features/auth/signin_screen.dart';
import 'package:price_list_pro/features/auth/signup_screen.dart';
import 'package:price_list_pro/features/home/customer_list/customer_list_screen.dart';
import 'package:price_list_pro/features/home/home_Screen.dart';
import 'package:price_list_pro/features/home/ware_list/ware_list_screen.dart';
import 'package:price_list_pro/features/main/main_screen.dart';

Route generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MainScreen.id:
      return MaterialPageRoute(builder: (_) => const MainScreen());
    case SignInScreen.id:
      return MaterialPageRoute(builder: (_)=>  SignInScreen());
    case SignUpScreen.id:
      return MaterialPageRoute(builder: (_)=>  SignUpScreen());
    case HomeScreen.id:
      return MaterialPageRoute(builder: (_)=> const HomeScreen());
      case AddWareScreen.id:
      return MaterialPageRoute(builder: (_)=> const AddWareScreen());
      case AddCustomerScreen.id:
      return MaterialPageRoute(builder: (_)=> const AddCustomerScreen());
      case CustomerListScreen.id:
      return MaterialPageRoute(builder: (_)=> const CustomerListScreen());

      case WareListScreen.id:
      return MaterialPageRoute(builder: (_)=> const WareListScreen());

    // case CategoryDealScreen.id:
    //   String category=routeSettings.arguments as String;
    //   return MaterialPageRoute(builder: (_) => CategoryDealScreen(categoryName: category,));
     default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('the Screen is not exist.'),
            ),
          ));
  }
}