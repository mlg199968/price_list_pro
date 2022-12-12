import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/card_button.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/add/add_ware/ware_services.dart';
import 'package:price_list_pro/features/home/customer_list/customer_list_screen.dart';
import 'package:price_list_pro/features/home/ware_list/ware_list_screen.dart';
import 'package:price_list_pro/model/ware.dart';

class HomeScreen extends StatefulWidget {
  static const String id="/homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                CardButton(width:200,label: "Ware List",image: "4",onTap: (){
                  Navigator.pushNamed(context, WareListScreen.id);
                },),
                CardButton(label: "Add Bills",image: "5",onTap: (){},),
              ],
            ),
            CardButton(label: "Customer List",image: "5",onTap: (){
              Navigator.pushNamed(context, CustomerListScreen.id);
            },direction: false,height: 100,),
          ],
        ),
      ),
    );
  }
}
