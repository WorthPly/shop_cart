import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/payment_tab.dart';
import 'package:flutter_ecommerce_app/screens/shipping_tab.dart';

import 'confirmation_tab.dart';

class CheckoutTabPage extends StatefulWidget {
  @override
  _CheckoutTabPageState createState() => _CheckoutTabPageState();
}

class _CheckoutTabPageState extends State<CheckoutTabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.grey[600],
            ),
            onPressed: () {},
          ),
          title: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: Colors.grey[500],
            labelColor: Colors.blue,
            indicatorColor: Colors.green,
            labelStyle: TextStyle(fontWeight: FontWeight.w400),
            tabs: [
              Tab(text: "Shipping"),
              Tab(text: "Payment"),
              Tab(text: "Confirmation")
            ],
          ),
        ),
        body: TabBarView(children: [
          ShippingTab(),
          PaymentTab(),
          ConfirmationTab(),
        ]),
      ),
    );
  }
}
