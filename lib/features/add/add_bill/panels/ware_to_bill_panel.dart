import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/common/widgets/drop_list_model.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/constants/utils.dart';
import 'package:price_list_pro/features/add/add_bill/screens/ware_select_screen.dart';
import 'package:price_list_pro/model/bill_ware.dart';

class WareToBillPanel extends StatefulWidget {
  WareToBillPanel({Key? key}) : super(key: key);

  @override
  State<WareToBillPanel> createState() => _WareToBillPanelState();
}

class _WareToBillPanelState extends State<WareToBillPanel> {
  TextEditingController wareNameController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  String unitItem = unitList[0];

  void getWareData(ware) {
    wareNameController.text = ware.wareName;
    salePriceController.text = ware.sale.toString();
    quantityController.text = 1.toString();
    unitItem = ware.unit;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List newUnitList = [unitItem, ...unitList].toSet().toList();
    return Container(
        height: MediaQuery.of(context).size.height* .7,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(0),
        child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            label: "Ware Name",
                            controller: wareNameController,
                            width: MediaQuery.of(context).size.width * .5,
                          ),
                          CustomButton(
                            text: "Choose",
                            width: MediaQuery.of(context).size.width * .2,
                            onPressed: () {
                              Navigator.pushNamed(context, WareSelectScreen.id)
                                  .then((value) {
                                if (value != null) {
                                  getWareData(value);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: "Sale Price",
                        controller: salePriceController,
                        width: MediaQuery.of(context).size.width,
                        textFormat: TextFormatter.price,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            label: "Quantity",
                            controller: quantityController,
                            textFormat: TextFormatter.number,
                          ),
                          DropListModel(
                              listItem: newUnitList,
                              width: 110,
                              onChanged: (value) {
                                unitItem = value;
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          width: MediaQuery.of(context).size.width,
                          text: "Add to Bill",
                          onPressed: () {
                            if (wareNameController.text.isNotEmpty) {
                              BillWare billWare = BillWare(
                                wareName: wareNameController.text,
                                unit: unitItem,
                                sale: StringToDouble(salePriceController.text),
                                quantity: double.parse(quantityController.text),
                                sum: StringToDouble(salePriceController.text) *
                                    double.parse(quantityController.text),
                              );
                              Navigator.pop(context, billWare);
                            }
                          }),
                    ],
                  ),


    );
  }
}
