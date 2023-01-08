import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/common/widgets/drop_list_model.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/features/add/add_bill/panels/cash_to_bill.dart';
import 'package:price_list_pro/features/add/add_bill/panels/cheque_to_bill.dart';
import 'package:price_list_pro/features/add/add_bill/panels/ware_to_bill_panel.dart';
import 'package:price_list_pro/features/add/add_bill/screens/ware_select_screen.dart';
import 'package:price_list_pro/model/bill_ware.dart';

class TabBarHolder extends StatefulWidget {
  TabBarHolder({Key? key}) : super(key: key);
  @override
  State<TabBarHolder> createState() => _WareToBillPanelState();
}
class _WareToBillPanelState extends State<TabBarHolder> {


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white.withOpacity(.5),
      content: Container(
        decoration: BoxDecoration(gradient: kCardGradiant),
        height: MediaQuery.of(context).size.height* .7,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(0),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(gradient: kMainGradiant),
                child: Text("Add to Bill",style: kHeaderStyle.copyWith(color: Colors.white),),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Ware",),
                  Tab(text: "cheque",),
                  Tab(text: "cash",),
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(8),
              child: TabBarView(
                  children:[
                    WareToBillPanel(),
                    ChequeToBill(),
                    CashToBill()

                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
