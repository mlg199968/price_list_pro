import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/home/customer_list/customer_list_screen.dart';
import 'package:price_list_pro/features/home/customer_list/screens/edit_customer_screen.dart';
import 'package:price_list_pro/local_storage/customer_local_storage.dart';
import 'package:price_list_pro/model/customer.dart';
import 'package:price_list_pro/model/sqflite_model/customer_sqflite.dart';



// ignore: must_be_immutable
class CustomerInfoPanel extends StatelessWidget {
  CustomerInfoPanel(this.infoData, {super.key});
  CustomerSqflite infoData;

  void delete()async{
    await CustomerDB.instance.delete(infoData.customerId);
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Customer info'),
      actions: [
        Container(
          padding: const EdgeInsetsDirectional.all(15),
          child: Column(
            children: <Widget>[
              CustomerInfoPanelRow(title: "Name",infoList: infoData.firstName),
              CustomerInfoPanelRow(title: "Last Name",infoList: infoData.lastName),
              CustomerInfoPanelRow(title: "Nick Name",infoList: infoData.nickName),
              CustomerInfoPanelRow(title: "Phone Number",infoList: infoData.phoneNumber),
              CustomerInfoPanelRow(title: "Phone Number2",infoList: infoData.phoneNumber2),
              CustomerInfoPanelRow(title: "Description",infoList: infoData.description),
              CustomerInfoPanelRow(title: "Date",infoList: infoData.date.toString()),
              CustomerInfoPanelRow(title: "Id",infoList: infoData.customerId),

              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient:kMainGradiant ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap:()async{
                        delete();
                        Navigator.pushNamed(context, CustomerListScreen.id);
                      },
                      child: const Icon(Icons.delete,color: Colors.white70,),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context, EditCustomerScreen.id,arguments: infoData);

                      },
                      child: const Icon(Icons.drive_file_rename_outline_sharp,color: Colors.white70,),
                    ),

                  ],),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomerInfoPanelRow extends StatelessWidget {
  const CustomerInfoPanelRow({super.key,
    required this.infoList,required this.title
  });

  final String infoList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width *.35,
              child: Text(infoList,maxLines: 2,overflow: TextOverflow.ellipsis,)),
          Text(title),

        ],),
    );
  }
}
