import 'package:flutter/material.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/add/add_screen.dart';
import 'package:price_list_pro/features/auth/signin_screen.dart';
import 'package:price_list_pro/features/home/home_Screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final List pages = [
    const HomeScreen(),
    const AddScreen(),
    const Text("Analytics Page"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, SignInScreen.id);
              },
              child: const Text(
                "Sign in",
                style: TextStyle(color: kWhiteColor),
              ),
            ),
          ),
        ],
        leading: const Icon(Icons.list,size: 30,),
        title: const Text("Main Screen"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kMainGradiant),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(gradient: kMainGradiant),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white54,
          selectedItemColor: Colors.white,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          backgroundColor: Colors.transparent,
          currentIndex: pageIndex,
          onTap: (index) {
            pageIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: "home",
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home,
                    )
                  : const Icon(
                      Icons.home_outlined,
                    ),
            ),
            BottomNavigationBarItem(
              label: "add product",
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.add_circle,
                    )
                  : const Icon(
                      Icons.add_circle_outline,
                    ),
            ),
            BottomNavigationBarItem(
              label: "Analytics",
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.analytics,
                    )
                  : const Icon(
                      Icons.analytics_outlined,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
