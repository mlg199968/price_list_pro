import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/add/add_bill/add_bill.dart';
import 'package:price_list_pro/features/home/customer_list/customer_list_screen.dart';
import 'package:price_list_pro/features/home/home_screen.dart';
import 'package:price_list_pro/features/main/main_screen.dart';
import 'package:price_list_pro/local_storage/customer_local_storage.dart';
import 'package:price_list_pro/model/sqflite_model/customer_sqflite.dart';
import 'package:price_list_pro/services/customer_services.dart';
import 'package:uuid/uuid.dart';

class AddCustomerScreen extends StatefulWidget {
  static const String id = "/addCustomerScreen";
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController phoneNumberController2 = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  CustomerServices customerServices = CustomerServices();
  // void addCustomer() {
  //   customerServices.postCustomerData(
  //       context: context,
  //       firstName: firstNameController.text,
  //       lastName: lastNameController.text,
  //       phoneNumber: phoneNumberController.text,
  //       nickName: nickNameController.text,
  //       description: descriptionController.text);
  // }
  void addCustomer() async {
    CustomerSqflite customerSqflite = CustomerSqflite(
        firstName: firstNameController.text,
        lastName: lastNameController.text ,
        phoneNumber:  phoneNumberController.text.isEmpty ?"": phoneNumberController.text,
        phoneNumber2:  phoneNumberController2.text.isEmpty ?"": phoneNumberController2.text,
        nickName: nickNameController.text.isEmpty ?"":nickNameController.text,
        description: descriptionController.text.isEmpty ?"":descriptionController.text,
        date: DateTime.now(),
        score: 10,
        customerId: const Uuid().v1());
    await CustomerDB.instance.create(customerSqflite);
  }

  @override
  void dispose() {
    firstNameController;
    lastNameController;
    phoneNumberController;
    phoneNumberController2;
    nickNameController;
    descriptionController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kMainGradiant),
        ),
        title: const Text("Add Customer"),
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
                    height: 30,
                  ),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  /// Name Inputs
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: kBoxDecoration.copyWith(color: Colors.transparent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                            label: "First Name", controller: firstNameController),
                        const SizedBox(
                          height: kSpaceBetween/2,
                        ),
                        CustomTextField(
                            label: "Last Name", controller: lastNameController),
                        const SizedBox(
                          height: kSpaceBetween/2,
                        ),
                        CustomTextField(
                            label: "Nick Name", controller: nickNameController),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  ///phones number part
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: kBoxDecoration.copyWith(color: Colors.transparent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                            label: "Phone Number", controller: phoneNumberController),
                        const SizedBox(
                          height: kSpaceBetween/2,
                        ),
                        CustomTextField(
                            label: "Phone Number 2", controller: phoneNumberController2),
                      ],
                    ),
                  ),

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
            CustomButton(
              width: double.infinity,
                text: "Add to Customer",
                onPressed: () {
                  addCustomer();
                  setState(() {});
                  Navigator.of(context).popAndPushNamed(CustomerListScreen.id);
                  //Navigator.of(context).pushNamedAndRemoveUntil(CustomerListScreen.id,(route)=>route.settings.name ==AddCustomerScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
