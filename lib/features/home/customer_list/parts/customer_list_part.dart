import 'package:flutter/material.dart';
import 'package:price_list_pro/features/home/customer_list/parts/customer_info_panel.dart';
import 'package:price_list_pro/features/home/ware_list/panels/info_panel.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';
import 'package:price_list_pro/model/customer.dart';

class CustomerListPart extends StatelessWidget {
  const CustomerListPart({Key? key,required this.customerList}) : super(key: key);
  final List<Customer> customerList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: customerList.length,
          itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomerInfoPanel(customerList[index]);
              },
            );
          },
          child: Row(
            children: [
              CellContent(cell:customerList[index].firstName,holderFlex:4,),
              CellContent(cell:customerList[index].lastName, holderFlex:4,),
              CellContent(cell:customerList[index].nickName, holderFlex:3,),
            ],
          ),
        );
      }),
    );
  }
}
