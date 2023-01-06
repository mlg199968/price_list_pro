
import 'package:flutter/material.dart';
import 'package:price_list_pro/features/home/ware_list/panels/list_panel.dart';
import 'package:price_list_pro/model/ware.dart';
import 'package:price_list_pro/services/ware_services.dart';

class WareProvider extends ChangeNotifier{
 List groupList=["default",];
 String selectedGroup="default";
 WareServices wareServices=WareServices();
 String connectionState="waiting";




void addGroup(String groupName){
  groupList.add(groupName);
  notifyListeners();
}


// Future<List> getWares(BuildContext context)async{
// List wares =await wareServices.getWares(context);
// notifyListeners();
// return wares;
// }

}