import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_float_action_button.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/features/add/add_bill/panels/ware_to_bill_panel.dart';
import 'package:price_list_pro/features/add/add_bill/screens/customer_select_screen.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';
import 'package:price_list_pro/model/bill_ware.dart';
import 'package:price_list_pro/model/customer.dart';
import 'package:price_list_pro/services/bill_services.dart';

class AddBill extends StatefulWidget {
  static const String id = "/AddBill";
  const AddBill({Key? key}) : super(key: key);

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  List<BillWare> wareData = [];
  Customer? customer;
  String customerName="Choose";
  bool isShow = false;
  double sum = 0;
  String formattedDate =
      DateFormat('kk:mm:ss  y/ MM/ dd').format(DateTime.now());
  BillServices billServices=BillServices();
  void postBill(BuildContext context)async{
    if(customer!=null) {
      await billServices.PostBill(context: context, billWares: wareData, customer: customer!, total: sum, time: DateTime.now());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: CustomFabLoc(),
      floatingActionButton: CustomFloatActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => WareToBillPanel())
              .then((value) {
            if (value != null) {
              wareData.add(value);
              sum += value.sum;
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
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            //TODO: Time & Date Part
            Container(
              height: MediaQuery.of(context).size.height * .05,
              alignment: Alignment.center,
              decoration: kBoxDecoration,
              child: Text(
                formattedDate,
                style: kCellStyle,
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
                        .then((dynamic value) {
                      if (value != null) {
                        customer=value;

                      }
                      setState(() {});
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: kBoxDecoration,
                    child: Text(
                      customer!=null ? "${customer!.firstName} ${customer!.lastName}": "Choose",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //TODO:  Product List Part
            Container(
              height: MediaQuery.of(context).size.height * .5,
              width: double.maxFinite,
              decoration: kBoxDecoration,
              child: wareData.isEmpty
                  ? const Center(child: Text("Nothing yet"))
                  : ListView.builder(
                      itemCount: wareData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              CellContent(
                                cell: addSeparator(wareData[index].sum),
                                holderFlex: 10,
                                align: TextAlign.left,
                              ),
                              CellContent(
                                cell: wareData[index].sale.toString(),
                                holderFlex: 7,
                                maxSize: 17,
                              ),
                              CellContent(
                                cell: wareData[index].unit,
                                holderFlex: 6,
                                maxSize: 15,
                              ),
                              CellContent(
                                cell: wareData[index].quantity.toString(),
                                holderFlex: 4,
                                maxSize: 15,
                              ),
                              CellContent(
                                  cell: wareData[index].wareName,
                                  holderFlex: 10),
                            ],
                          ),
                        );
                      }),
            ),
            const SizedBox(height: 10),
            //TODO: final data of bill like sale total
            Container(
              height: 50,
              decoration: kBoxDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "total",
                    style: kCellStyle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(addSeparator(sum), style: kCellStyle),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Opacity(
              opacity:customer==null || wareData.isEmpty? .3 :1.0,
              child: CustomButton(
                text: "Publish",
                onPressed: () {
                  if(customer != null || wareData.isNotEmpty) {
                    postBill(context);
                  }
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
