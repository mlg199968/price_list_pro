import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/add/add_bill/screens/customer_select_screen.dart';

class AddBill extends StatefulWidget {
  static const String id = "/AddBill";
  const AddBill({Key? key}) : super(key: key);

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  String customerName = "Customer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      customerName = value.toString();
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
                child: const Icon(Icons.add_box_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
