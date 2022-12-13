import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';

import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:provider/provider.dart';



// ignore: must_be_immutable
class CreateGroupPanel extends StatelessWidget {
  CreateGroupPanel(this.updateUINotifier, {super.key});
  TextEditingController groupPanelTextFieldController=TextEditingController();
  Function updateUINotifier;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Group'),
      actions: [
        Container(
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:20 ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CustomTextField(label: "Group Name", controller: groupPanelTextFieldController),
                    ]),
              ),
              CustomButton(text: "Add", onPressed: (){
                Provider.of<WareProvider>(context,listen: false).addGroup(groupPanelTextFieldController.text);
                Provider.of<WareProvider>(context,listen: false).selectedGroup=groupPanelTextFieldController.text;
                updateUINotifier();
                groupPanelTextFieldController.clear();
                Navigator.pop(context);
              })



            ],
          ),
        ),
      ],
    );
  }
}