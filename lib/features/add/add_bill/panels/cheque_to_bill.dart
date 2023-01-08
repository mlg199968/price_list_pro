import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/common/widgets/drop_list_model.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/features/add/add_bill/screens/ware_select_screen.dart';
import 'package:price_list_pro/model/bill_ware.dart';

class ChequeToBill extends StatefulWidget {
  ChequeToBill({Key? key}) : super(key: key);

  @override
  State<ChequeToBill> createState() => _WareToBillPanelState();
}

class _WareToBillPanelState extends State<ChequeToBill> {

  String date=Jalali.now().formatCompactDate();
  TextEditingController wareNameController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height* .7,
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
              label: "Bank Name",
              controller: wareNameController,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              label: "check amount",
              controller: salePriceController,
              width: MediaQuery.of(context).size.width,
              textFormat: TextFormatter.price,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("cheque date",style: TextStyle(color: Colors.blue,fontSize: 20),),
                Container(
                  decoration: kBoxDecoration,
                  child: TextButton(
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
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              label: "Cheque Owner",
              width: MediaQuery.of(context).size.width,
              controller: quantityController,
              textFormat: TextFormatter.number,
            ),
            const SizedBox(
              height: 20,
            ),
CustomTextField(
              label: "Description",
              maxLine: 3,
              width: MediaQuery.of(context).size.width,
              controller: quantityController,
              textFormat: TextFormatter.number,
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),


      ),
    );
  }
}

