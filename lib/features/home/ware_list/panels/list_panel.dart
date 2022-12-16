import 'package:flutter/material.dart';
import 'package:price_list_pro/features/home/ware_list/panels/info_panel.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';
import 'package:price_list_pro/model/ware.dart';
class ListPanel extends StatelessWidget {
  const ListPanel({Key? key,required this.category,required this.wareList}) : super(key: key);
  final String category;
  final List<Ware> wareList;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: wareList.length,
          itemBuilder: (context,index){
            if(category==wareList[index].group) {
              return GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return InfoPanel(wareList[index]);
                    },
                  );
                },
                child: Row(
                  children: [
                    CellContent(
                        cell:wareList[index].sale.toString(), holderFlex:4),
                    CellContent(cell:wareList[index].unit, holderFlex:2),
                    CellContent(cell:wareList[index].wareName, holderFlex:8),
                  ],
                ),
              );
            }
            else if(category=="all"){
              return GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return InfoPanel(wareList[index]);
                    },
                  );
                },
                child: Row(
                  children: [
                    CellContent(
                      cell:wareList[index].sale.toString(), holderFlex:4),
                    CellContent(cell:wareList[index].unit, holderFlex:2),
                    CellContent(cell:wareList[index].wareName, holderFlex:8),
                  ],
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
