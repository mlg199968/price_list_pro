import 'package:flutter/material.dart';
import 'package:price_list_pro/features/add/add_ware/ware_services.dart';
import 'package:price_list_pro/features/home/ware_list/panels/info_panel.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';
import 'package:price_list_pro/model/ware.dart';
import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:provider/provider.dart';
class ListPanel extends StatelessWidget {
  const ListPanel({Key? key,required this.category,required this.wareList}) : super(key: key);
  final String category;
  final List<Ware> wareList;


  @override
  Widget build(BuildContext context) {
    final groupList=Provider.of<WareProvider>(context,listen: false).groupList;
    return Expanded(
      child: ListView.builder(
          itemCount: wareList.length,
          itemBuilder: (context,index){
            if(category==wareList[index].group) {
              return Row(
                children: [
                  CellContent(
                      cell:wareList[index].sale.toString(), holderFlex:4,onTapWidget: InfoPanel(wareList[index]),),
                  CellContent(cell:wareList[index].unit, holderFlex:2,onTapWidget: InfoPanel(wareList[index]),),
                  CellContent(cell:wareList[index].wareName, holderFlex:8,onTapWidget: InfoPanel(wareList[index]),),
                ],
              );
            }
            else if(category=="all"){
              return Row(
                children: [
                  CellContent(
                    cell:wareList[index].sale.toString(), holderFlex:4,onTapWidget: InfoPanel(wareList[index]),),
                  CellContent(cell:wareList[index].unit, holderFlex:2,onTapWidget: InfoPanel(wareList[index]),),
                  CellContent(cell:wareList[index].wareName, holderFlex:8,onTapWidget: InfoPanel(wareList[index]),),
                ],
              );
            }
            return const SizedBox();
          }),
    );
  }
}
