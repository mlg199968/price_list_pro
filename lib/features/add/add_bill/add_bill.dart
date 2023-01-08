import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_date_picker.dart';
import 'package:price_list_pro/common/widgets/custom_float_action_button.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/features/add/add_bill/panels/tab_bar.dart';
import 'package:price_list_pro/features/add/add_bill/panels/ware_to_bill_panel.dart';
import 'package:price_list_pro/features/add/add_bill/screens/customer_select_screen.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';
import 'package:price_list_pro/model/bill_ware.dart';
import 'package:price_list_pro/model/customer.dart';
import 'package:price_list_pro/model/sqflite_model/customer_sqflite.dart';
import 'package:price_list_pro/services/bill_services.dart';

class AddBill extends StatefulWidget {
  static const String id = "/AddBill";
  const AddBill({Key? key}) : super(key: key);

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  List<BillWare> billWares = [];
  CustomerSqflite? customer;
  String customerName="Choose";
  bool isShow = false;
  double sum = 0;
  String date =Jalali.now().formatCompactDate();
  String time = DateFormat('kk:mm').format(DateTime.now());
     // DateFormat('kk:mm:ss  y/ MM/ dd').format(DateTime.now());

  //BillServices billServices=BillServices();
  // void postBill(BuildContext context)async{
  //   if(customer!=null) {
  //     await billServices.PostBill(context: context, billWares: billWares, customer: customer!, total: sum, time: DateTime.now());
  //   }
  //}
void saveBillOnLocalStorage(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: CustomFabLoc(),
      floatingActionButton: CustomFloatActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => TabBarHolder())
              .then((value) {
            if (value != null) {
              billWares.add(value);
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
      ///choose date
                  TextButton(
                    onPressed: () async {
                      Jalali? picked = await showPersianDatePicker(
                        context: context,
                        initialDate: Jalali.now(),
                        firstDate: Jalali(1385, 8),
                        lastDate: Jalali(1450, 9),

                      );
                      if (picked != null) {
                        setState(() {
                          date = picked.formatCompactDate();
                        });
                      }
                    },
                    child: Text(
                      date,
                      style: kCellStyle.copyWith(color: Colors.blue),
                    ),
                  ),
      ///choose time
                  TextButton(
                    onPressed: () async {
                      Jalali? pickedDate = await showModalBottomSheet<Jalali>(
                        context: context,
                        builder: (context) {
                          Jalali tempPickedDate=DateTime.now().toJalali();
                          return SizedBox(
                            height: 250,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CupertinoButton(
                                        child: const Text(
                                          'لغو',
                                          style: TextStyle(
                                            fontFamily: 'Dana',
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      CupertinoButton(
                                        child: const Text(
                                          'تایید',
                                          style: TextStyle(
                                            fontFamily: 'Dana',
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(tempPickedDate);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 1,
                                ),
                                Expanded(
                                  child: CupertinoTheme(
                                    data: const CupertinoThemeData(
                                      textTheme: CupertinoTextThemeData(
                                        dateTimePickerTextStyle: TextStyle(fontFamily: 'Dana'),
                                      ),
                                    ),
                                    child: PCupertinoDatePicker(
                                      mode: PCupertinoDatePickerMode.time,
                                      onDateTimeChanged: (Jalali dateTime) {
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      if (pickedDate != null) {
                        setState(() {
                          time = DateFormat("hh:mm").format(pickedDate.toDateTime());
                        });
                      }
                    },
                    child: Text(
                      time,
                      style: kCellStyle.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            //TODO:  Product List Part
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: double.maxFinite,
              decoration: kBoxDecoration,
              child: billWares.isEmpty
                  ? const Center(child: Text("Nothing yet"))
                  : ListView.builder(
                      itemCount: billWares.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              CellContent(
                                cell: addSeparator(billWares[index].sum),
                                holderFlex: 10,
                                align: TextAlign.left,
                              ),
                              CellContent(
                                cell: billWares[index].sale.toString(),
                                holderFlex: 7,
                                maxSize: 17,
                              ),
                              CellContent(
                                cell: billWares[index].unit,
                                holderFlex: 6,
                                maxSize: 15,
                              ),
                              CellContent(
                                cell: billWares[index].quantity.toString(),
                                holderFlex: 4,
                                maxSize: 15,
                              ),
                              CellContent(
                                  cell: billWares[index].wareName,
                                  holderFlex: 10),
                            ],
                          ),
                        );
                      }),
            ),
            const SizedBox(height: 10),
            //TODO:  paid List Part
            ShoppingList(billWares: billWares),
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
              opacity:customer==null || billWares.isEmpty? .3 :1.0,
              child: CustomButton(
                width: double.infinity,
                text: "Publish",
                onPressed: () {
                  if(customer != null || billWares.isNotEmpty) {
                    saveBillOnLocalStorage();
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

class ShoppingList extends StatelessWidget {
  const ShoppingList({
    super.key,
    required this.billWares,
  });

  final List<BillWare> billWares;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: double.maxFinite,
      decoration: kBoxDecoration,
      child: billWares.isEmpty
          ? const Center(child: Text("Nothing yet"))
          : ListView.builder(
          itemCount: billWares.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  CellContent(
                    cell: addSeparator(billWares[index].sum),
                    holderFlex: 10,
                    align: TextAlign.left,
                  ),
                  CellContent(
                    cell: billWares[index].sale.toString(),
                    holderFlex: 7,
                    maxSize: 17,
                  ),
                  CellContent(
                    cell: billWares[index].unit,
                    holderFlex: 6,
                    maxSize: 15,
                  ),
                  CellContent(
                    cell: billWares[index].quantity.toString(),
                    holderFlex: 4,
                    maxSize: 15,
                  ),
                  CellContent(
                      cell: billWares[index].wareName,
                      holderFlex: 10),

                ],
              ),
            );
          }),
    );
  }
}
