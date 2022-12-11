import 'package:flutter/material.dart';
import 'package:price_list_pro/features/add/add_ware/ware_services.dart';
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
              return Container(
                child: Row(
                  children: [
                    CellContent(
                        wareList[index].sale.toString(), wareList[index], 4),
                    CellContent(wareList[index].unit, wareList[index], 2),
                    CellContent(wareList[index].wareName, wareList[index], 8),
                  ],
                ),
              );
            }
            else if(category=="all"){
              return Row(
                children: [
                  CellContent(
                      wareList[index].sale.toString(), wareList[index], 4),
                  CellContent(wareList[index].unit, wareList[index], 2),
                  CellContent(wareList[index].wareName, wareList[index], 8),
                ],
              );
            }
            return const SizedBox();
          }),
    );
  }
}
