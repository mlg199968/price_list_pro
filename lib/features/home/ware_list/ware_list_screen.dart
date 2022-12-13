import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/drop_list_model.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/services/ware_services.dart';
import 'package:price_list_pro/features/home/ware_list/panels/list_panel.dart';
import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:provider/provider.dart';

class WareListScreen extends StatefulWidget {
  static const String id = "/wareListScreen";
  const WareListScreen({Key? key}) : super(key: key);

  @override
  State<WareListScreen> createState() => _WareListScreenState();
}

class _WareListScreenState extends State<WareListScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedDropListGroup="all";
  WareServices wareServices=WareServices();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      //scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(Icons.library_add_check_sharp)),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(gradient: kGradiantColor1),
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
              //TODO:Price List Header
              Container(
                decoration: const BoxDecoration(gradient: kGradiantColor1),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Sale',
                      style: kHeaderStyle.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Unit',
                      style: kHeaderStyle.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    Text(
                      'Ware',
                      style: kHeaderStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future:wareServices.getWares(context),
                builder:(context,snapshot) {
                   if(snapshot.connectionState==ConnectionState.waiting){
                     return const Expanded(child: Center(child: CircularProgressIndicator()));
                   }

                  else if(snapshot.data==null) {
                     return  const Expanded(child: Center(child: Text("No data")));
                   }
                     return ListPanel(
                      wareList: snapshot.data!,
                      category: selectedDropListGroup ??
                          Provider
                              .of<WareProvider>(context, listen: false)
                              .groupList[0]);

                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
