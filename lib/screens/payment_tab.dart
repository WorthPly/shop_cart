import 'package:flutter/material.dart';

class PaymentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Promo Code"),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "#1243",
                              contentPadding: const EdgeInsets.all(10)),
                        ),
                      ),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        color: Colors.blue,
                        child: Center(
                            child: Text(
                          "APPLY",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                PaymentTypeWidget(),
                Container(height: 0.3, color: Colors.grey),
                PaymentTypeWidget(),
                Container(height: 0.3, color: Colors.grey),
                PaymentTypeWidget(),
                Container(height: 0.3, color: Colors.grey),
              ],
            ),
          ),
          Container(height: 0.3, color: Colors.grey),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "Total Amount",
                  style: TextStyle(),
                )),
                Text(
                  "₹ 12,495",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: ContinueToPayButton(),
    );
  }
}

class PaymentTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.casino,
            size: 30,
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Text(
            "Cash on delivery",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.w400),
          )),
          Icon(
            Icons.radio_button_unchecked,
            color: Colors.grey,
          ),
        ],
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
                "CONTINUE TO CONFIRMATION",
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
