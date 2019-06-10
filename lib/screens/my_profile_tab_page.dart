import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/profile_page.dart';
import 'package:flutter_ecommerce_app/screens/whishlist_page.dart';

import 'my_orders_page.dart';

class MyProfileTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey[500],
                indicatorColor: Colors.green,
                tabs: [
                  Tab(text: "Profile"),
                  Tab(text: "My orders"),
                  Tab(text: "Wishlist"),
                  Tab(text: "Saved"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProfilePage(),
                  MyOrdersPage(),
                  WishListPage(),
                  Text("test"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
