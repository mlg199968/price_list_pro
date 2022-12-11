
import 'package:flutter/material.dart';

class WareProvider extends ChangeNotifier{
final List groupList=["default","dewfsdf","another"];
final List wareList=[
  ["sdsd","23423","4234","sdfdsg"],
  ["sdsd","23423","4234","sdfdsg"],
  ["sdsd","23423","4234","sdfdsg"],
  ["sdsd","23423","4234","sdfdsg"],
];
final wareList2=[];



void addGroup(String group){
  groupList.add(group);
  notifyListeners();
}
}