import 'package:flutter/material.dart';
import 'package:price_list_pro/features/add/add_bill/add_bill.dart';
import 'package:price_list_pro/features/add/add_bill/screens/customer_select_screen.dart';
import 'package:price_list_pro/features/add/add_bill/screens/ware_select_screen.dart';
import 'package:price_list_pro/features/add/add_customer/add_customer_screen.dart';
import 'package:price_list_pro/features/add/add_ware/add_ware_screen.dart';

import 'package:price_list_pro/features/auth/signin_screen.dart';
import 'package:price_list_pro/features/auth/signup_screen.dart';
import 'package:price_list_pro/features/home/customer_list/customer_list_screen.dart';
import 'package:price_list_pro/features/home/customer_list/screens/edit_customer_screen.dart';
import 'package:price_list_pro/features/home/home_screen.dart';
import 'package:price_list_pro/features/home/ware_list/screens/edit_ware_screen.dart';
import 'package:price_list_pro/features/home/ware_list/ware_list_screen.dart';
import 'package:price_list_pro/features/main/main_screen.dart';
import 'package:price_list_pro/model/sqflite_model/customer_sqflite.dart';
import 'package:price_list_pro/model/sqflite_model/ware_sqflite.dart';
import 'package:price_list_pro/model/ware.dart';

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
      case AddBill.id:
      return MaterialPageRoute(builder: (_)=> const AddBill());
      case CustomerSelectScreen.id:
      return MaterialPageRoute(builder: (_)=> const CustomerSelectScreen());
      case WareSelectScreen.id:
      return MaterialPageRoute(builder: (_)=> const WareSelectScreen());

      case WareListScreen.id:
      return MaterialPageRoute(builder: (_)=> const WareListScreen());

    case EditWareScreen.id:
      WareSqflite wareInfo=routeSettings.arguments as WareSqflite;
      return MaterialPageRoute(builder: (_) => EditWareScreen(wareInfo: wareInfo,));
      case EditCustomerScreen.id:
      CustomerSqflite customerSqflite=routeSettings.arguments as CustomerSqflite;
      return MaterialPageRoute(builder: (_) => EditCustomerScreen(customerInfo: customerSqflite,));
     default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('the Screen is not exist.'),
            ),
          ));
  }
}