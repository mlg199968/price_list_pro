import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/card_button.dart';
import 'package:price_list_pro/features/add/add_bill/add_bill.dart';
import 'package:price_list_pro/features/add/add_customer/add_customer_screen.dart';
import 'package:price_list_pro/features/add/add_ware/add_ware_screen.dart';


class AddScreen extends StatefulWidget {
  static const String id = "/addWearScreen";
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardButton(
                label: "Add Bill",
                image: "7",
                width: double.maxFinite,
                height: 150,
                direction: false,
                onTap: () {
                  Navigator.pushNamed(context, AddBill.id);
                },
              ),
              CardButton(
                label: "Add Ware",
                image: "7",
                width: double.maxFinite,
                height: 150,
                direction: false,
                onTap: () {
                  Navigator.pushNamed(context, AddWareScreen.id);
                },
              ),
              CardButton(
                label: "Add Customer",
                image: "2",
                width: double.maxFinite,
                height: 150,
                direction: false,
                onTap: () {
                  Navigator.pushNamed(context, AddCustomerScreen.id);
                },
              ),
              CardButton(
                label: "Add Seller",
                image: "3",
                width: double.maxFinite,
                height: 150,
                direction: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
