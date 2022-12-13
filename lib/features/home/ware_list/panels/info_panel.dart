// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/model/ware.dart';


// ignore: must_be_immutable
class InfoPanel extends StatelessWidget {
  InfoPanel(this.infoData, {super.key});
  Ware infoData;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('info Panel'),
      actions: [
        Container(
          padding: const EdgeInsetsDirectional.all(15),
          child: Column(
            children: <Widget>[
              infoPanelRow(title: "Ware",infoList: infoData.wareName),
              infoPanelRow(title: "group",infoList: infoData.group),
              infoPanelRow(title: "unit",infoList: infoData.unit),
              infoPanelRow(title: "Cost",infoList: infoData.cost.toString()),
              infoPanelRow(title: "Sale",infoList: infoData.sale.toString()),
              infoPanelRow(title: "Quantity",infoList: infoData.quantity.toString()),
              infoPanelRow(title: "Description",infoList: infoData.description),
              infoPanelRow(title: "id",infoList: infoData.id.toString()),


              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient:kMainGradiant ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  GestureDetector(
                    onTap:(){},
                    child: const Icon(Icons.delete,color: Colors.white70,),
                  ),
                  GestureDetector(
                    onTap:(){},
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

class infoPanelRow extends StatelessWidget {
  const infoPanelRow({super.key,
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


