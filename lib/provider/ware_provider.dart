
import 'package:flutter/material.dart';

class WareProvider extends ChangeNotifier{
 List groupList=["default",];
 String selectedGroup="default";



void addGroup(String group){
  groupList.add(group);
  notifyListeners();
}
}