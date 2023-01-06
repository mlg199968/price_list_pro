
import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/card_button.dart';
import 'package:price_list_pro/local_storage/ware_local_storage.dart';
import 'package:price_list_pro/services/ware_services.dart';
import 'package:price_list_pro/features/home/customer_list/customer_list_screen.dart';
import 'package:price_list_pro/features/home/ware_list/ware_list_screen.dart';
import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WareServices wareServices = WareServices();
  @override
  void initState() {
    //getLocalGroupList();
    //getWaresCategory();
    super.initState();
  }

  void getWaresCategory() async {
    Provider.of<WareProvider>(context, listen: false).groupList =
        await wareServices.getWaresGroup(context);
  }
  void getLocalGroupList() async {
    Provider.of<WareProvider>(context,listen: false).groupList.add(await WareDB.instance.readAllGroupList());
  }

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
              children: [
                CardButton(
                  width: 200,
                  label: "Ware List",
                  image: "4",
                  onTap: () {
                    Navigator.pushNamed(context, WareListScreen.id);
                  },
                ),
                CardButton(
                  label: "Add Bills",
                  image: "5",
                  onTap: () {},
                ),
              ],
            ),
            CardButton(
              label: "Customer List",
              image: "5",
              onTap: () {
                Navigator.pushNamed(context, CustomerListScreen.id);
              },
              direction: false,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
