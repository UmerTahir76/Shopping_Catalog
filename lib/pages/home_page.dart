import 'package:ecomm_flutter/components/bottom_nav_bar.dart';
import 'package:ecomm_flutter/pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  int selectedIndex = 0;

  //this method will update our selected index
  // when the user taps on the  bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> pages = [
    // shop page
    const ShopPage(),
    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            // logo
            DrawerHeader(
                child: Image.asset('lib/images/nike.jpeg'),

            ),
            // Divider(
            //   color: Colors.grey[900], it will create a horizontal line
            // ),
            // other pages

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("Info"),
              ),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
