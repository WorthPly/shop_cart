import 'package:flutter/material.dart';

class ShippingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: MyTextField("First Name"),
              ),
              const SizedBox(width: 20),
              Expanded(child: MyTextField("Last Name"))
            ],
          ),
          const SizedBox(height: 20),
          MyTextField("Address"),
          const SizedBox(height: 20),
          MyTextField("Phone Number"),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: MyTextField("City"),
              ),
              const SizedBox(width: 20),
              Expanded(child: MyTextField("State"))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: MyTextField("Country"),
              ),
              const SizedBox(width: 20),
              Expanded(child: MyTextField("Zip Code"))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Delivery",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    deliveryType("Free", "Standard"),
                    const SizedBox(width: 10),
                    deliveryType("149", "Standard"),
                    const SizedBox(width: 10),
                    deliveryType("249", "Next-day"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: ContinueToPayButton(),
    );
  }

  Widget deliveryType(String price, String type) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "₹ $price",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            Text("$type",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                )),
          ],
        ),
      ),
    );
  }
}

class ContinueToPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 65,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "CONTINUE TO PAYMENT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
          )),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String labelText;

  MyTextField(this.labelText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
