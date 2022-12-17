import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/drop_list_model.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/home/ware_list/panels/list_panel.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';
import 'package:price_list_pro/model/customer.dart';
import 'package:price_list_pro/model/ware.dart';
import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:price_list_pro/services/customer_services.dart';
import 'package:price_list_pro/services/ware_services.dart';
import 'package:provider/provider.dart';


class WareSelectScreen extends StatefulWidget {
  static const String id = "/WareSelectScreen";
  const WareSelectScreen({Key? key}) : super(key: key);

  @override
  State<WareSelectScreen> createState() => _WareSelectScreenState();
}

class _WareSelectScreenState extends State<WareSelectScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchWareController = TextEditingController();
  WareServices wareServices=WareServices();
  String selectedDropListGroup="all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(gradient: kMainGradiant),
              ),
              title: Container(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Price List"),
                    //TODO:dropDown list for Group Select
                    Consumer<WareProvider>(
                      builder: (context, wareData, child) {
                        return DropListModel(
                          listItem: ["all",...wareData.groupList],
                          onChanged: (val) {
                            selectedDropListGroup = val;
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              elevation: 5.0,
              automaticallyImplyLeading: false,
              expandedHeight: 0,
              floating: true,
              snap: true,
            )
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: wareServices.getWares(context),
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }
                    else if (snapshot.data == null) {
                      return const Expanded(
                          child: Center(child: Text("No data")));
                    }
                    List<Ware> wareList=snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: wareList.length,
                          itemBuilder: (context,index){
                            if(selectedDropListGroup==wareList[index].group) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.pop(context,wareList[index]);
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
                            else if(selectedDropListGroup=="all"){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.pop(context,wareList[index]);
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}