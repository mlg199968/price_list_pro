import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/home/customer_list/parts/customer_list_part.dart';
import 'package:price_list_pro/services/customer_services.dart';


class CustomerListScreen extends StatefulWidget {
  static const String id = "/CustomerListScreen";
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
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
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      //scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(Icons.library_add_check_sharp)),
              ),
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
                  future: customerServices.getCustomers(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (snapshot.data == null) {
                      return const Expanded(
                          child: Center(child: Text("No data")));
                    }
                    return CustomerListPart(customerList: snapshot.data!);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
