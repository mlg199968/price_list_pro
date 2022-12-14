import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/home/ware_list/screens/edit_ware_screen.dart';
import 'package:price_list_pro/features/home/ware_list/ware_list_screen.dart';
import 'package:price_list_pro/services/ware_services.dart';




  InfoPanel({required BuildContext context,required wareInfo}){;

  WareServices wareServices=WareServices();
  void deleteWare(wareInfo)async{
   await wareServices.deleteWare(context,wareInfo.id!);
  }
    return AlertDialog(
      title: const Text('info Panel'),
      actions: [
        Container(
          padding: const EdgeInsetsDirectional.all(15),
          child: Column(
            children: <Widget>[
              infoPanelRow(title: "Ware",infoList:wareInfo.wareName),
              infoPanelRow(title: "group",infoList:wareInfo.group),
              infoPanelRow(title: "unit",infoList:wareInfo.unit),
              infoPanelRow(title: "Cost",infoList:wareInfo.cost.toString()),
              infoPanelRow(title: "Sale",infoList:wareInfo.sale.toString()),
              infoPanelRow(title: "Quantity",infoList:wareInfo.quantity.toString()),
              infoPanelRow(title: "Description",infoList:wareInfo.description),
              infoPanelRow(title: "id",infoList:wareInfo.id.toString()),


              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient:kMainGradiant ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  GestureDetector(
                    onTap:(){
                      deleteWare(wareInfo);
                      Navigator.pop(context);
                     // Navigator.pushNamedAndRemoveUntil(context,WareListScreen.id,(Route route)=>route.settings.name==WareListScreen.id);
                    },
                    child: const Icon(Icons.delete,color: Colors.white70,),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, EditWareScreen.id,arguments:wareInfo);
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



  infoPanelRow({required infoList,required title
  }){




    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       SizedBox(
         width:120,
           child: Text(infoList,maxLines: 2,overflow: TextOverflow.ellipsis,)),
       Text(title),

      ],),
    );
  }



