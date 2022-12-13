import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/common/widgets/drop_list_model.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/add/add_ware/panels/create_group_panel.dart';
import 'package:price_list_pro/services/ware_services.dart';
import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:provider/provider.dart';

class AddWareScreen extends StatefulWidget {
  static const String id = "/addWWearScreen";
  const AddWareScreen({Key? key}) : super(key: key);

  @override
  State<AddWareScreen> createState() => _AddWareScreenState();
}

class _AddWareScreenState extends State<AddWareScreen> {
  TextEditingController wareNameController = TextEditingController();
  TextEditingController costPriceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  String unitItem = unitList[0];
  WareServices wareServices = WareServices();
  void addWare() {
    wareServices.addWare(
      context: context,
      wareName: wareNameController.text,
      unit: unitItem,
      group:Provider.of<WareProvider>(context,listen: false).selectedGroup ,
      cost: double.parse(costPriceController.text),
      sale: double.parse(salePriceController.text),
      quantity: double.parse(quantityController.text),
      description: descriptionController.text
    );
  }

  @override
  void dispose() {
     wareNameController;
     costPriceController;
     salePriceController;
     quantityController;
     descriptionController;
    super.dispose();
  }
  void updateUINotifier(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final wareProvider = Provider.of<WareProvider>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kMainGradiant),
        ),
        title: const Text("Add Ware"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //TODO:select group dropdown list and add group
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(text: "Add Group", onPressed: () {
                        showDialog(context: context, builder: (context)=>CreateGroupPanel(updateUINotifier));

                      }),
                      DropListModel(
                          listItem: wareProvider.groupList.reversed.toList(),
                          onChanged: (value) {
                            wareProvider.selectedGroup=value;
                          },),

                    ],
                  ),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "Ware Name", controller: wareNameController),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  //TODO:unit dropdown list selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropListModel(
                          listItem: unitList,
                          onChanged: (val) {
                            unitItem=val;
                          },),

                      Text(
                        "Unit",
                        style: kHeaderStyle.copyWith(color: kColor1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "Cost Price", controller: costPriceController),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "Sale Price", controller: salePriceController),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "Quantity", controller: quantityController),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                    label: "Description",
                    controller: descriptionController,
                    maxLine: 4,
                  ),
                ],
              ),
            ),
            CustomButton(text: "Add to List", onPressed: () {
              addWare();
              setState(() {});
            }),
          ],
        ),
      ),
    );
  }
}
