import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/home/ware_list/widgets/cell.dart';
import 'package:price_list_pro/local_storage/customer_local_storage.dart';
import 'package:price_list_pro/model/customer.dart';
import 'package:price_list_pro/model/sqflite_model/customer_sqflite.dart';
import 'package:price_list_pro/services/customer_services.dart';


class CustomerSelectScreen extends StatefulWidget {
  static const String id = "/CustomerSelectScreen";
  const CustomerSelectScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSelectScreen> createState() => _CustomerSelectScreenState();
}

class _CustomerSelectScreenState extends State<CustomerSelectScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchCustomerController = TextEditingController();
  CustomerServices customerServices = CustomerServices();

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
                  children: const [
                    Text("Customer List"),
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
              //TODO:Search bar customer list
              Container(
                  decoration: const BoxDecoration(gradient: kMainGradiant),
                  //margin: const EdgeInsets.only(top: 20),
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(

                    controller: searchCustomerController,
                    onChanged: (val){},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search customer",
                      suffixIcon: const Icon(Icons.search_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )),
              FutureBuilder(
                  future: CustomerDB.instance.readAllData(context),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                    return const Expanded(
                    child: Center(child: Text("No data")));
                    }
                    else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }
                    List<CustomerSqflite> customerList=snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: customerList.length,
                          itemBuilder: (context,index){
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: GestureDetector(
                                onTap: (){
                                   CustomerSqflite customer=snapshot.data![index];
                                  Navigator.pop(context,customer);
                                },
                                child: Row(
                                  children: [
                                    CellContent(cell:customerList[index].firstName,holderFlex:4,),
                                    CellContent(cell:customerList[index].lastName, holderFlex:4,),
                                    CellContent(cell:customerList[index].nickName, holderFlex:3,),
                                  ],
                                ),
                              ),
                            );
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