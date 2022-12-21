import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_float_action_button.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/add/add_bill/panels/ware_to_bill_panel.dart';
import 'package:price_list_pro/features/add/add_bill/screens/customer_select_screen.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';

class AddBill extends StatefulWidget {
  static const String id = "/AddBill";
  const AddBill({Key? key}) : super(key: key);

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  List<Map<String, dynamic>> wareData = [];
  String customerName = "Customer";
  bool isShow=false;






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:CustomFabLoc(),
      floatingActionButton:CustomFloatActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context) => WareToBillPanel()).then((value) {
            if(value!=null) {
              wareData.add(value);
            }
            setState(() {});
          });
        },
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kMainGradiant),
        ),
        title: const Text("Add Bill"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //TODO: Time & Date Part
            Container(
              height: MediaQuery.of(context).size.height * .05,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: kMainGradiant,
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                "date & Time",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //TODO: Choose Customer Part
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Customer",
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CustomerSelectScreen.id)
                        .then((value) {
                      if (value != null) {
                        customerName = value.toString();
                      }
                      setState(() {});
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.lightBlue)),
                    child: Text(
                      customerName,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(border: Border.all(color: kColor1)),
                child: wareData.isEmpty
                    ? const Center(child: Text("Nothing yet"))
                    : ListView.builder(
                        itemCount: wareData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap:(){

                            },

                            child: Row(
                              children: [
                                CellContent(
                                    cell: wareData[index]["sum"]!.toString(),
                                    holderFlex: 10,
                                align: TextAlign.left,),
                                CellContent(
                                    cell: wareData[index]["sale"]!,
                                    holderFlex: 7,
                                  maxSize: 17,),
                                CellContent(
                                    cell: wareData[index]["unit"]!,
                                    holderFlex: 6,
                                maxSize: 15,),
                                CellContent(
                                    cell: wareData[index]["quantity"]!,
                                    holderFlex: 4,maxSize: 15,),
                                CellContent(
                                    cell: wareData[index]["name"]!,
                                    holderFlex: 10),
                              ],
                            ),
                          );
                        }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: "Publish", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
