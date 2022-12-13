import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/services/customer_services.dart';



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
  TextEditingController nickNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  CustomerServices customerServices = CustomerServices();
  void addCustomer() {
    customerServices.postCustomerData(
        context: context,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        nickName: nickNameController.text,
        description: descriptionController.text);
  }

  @override
  void dispose() {
    firstNameController;
    lastNameController;
    phoneNumberController;
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
                    height: 30,
                  ),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "First Name", controller: firstNameController),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "Last Name", controller: lastNameController),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "Nick Name", controller: nickNameController),
                  const SizedBox(
                    height: kSpaceBetween,
                  ),
                  CustomTextField(
                      label: "Phone Number", controller: phoneNumberController),
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
                text: "Add to Customer",
                onPressed: () {
                  addCustomer();
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}
