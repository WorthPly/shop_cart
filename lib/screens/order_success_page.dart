import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            "THANKYOU",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: 1.5),
          ),
          SizedBox(height: 10),
          Text(
            "FOR YOUR ORDER",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 25),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: "Order number:",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: " #SC124535",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
          Image.asset("assets/success_img.png"),
          SizedBox(height: 20),
          Text(
            "ESTIMATED DELIVERY",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                letterSpacing: 1),
          ),
          SizedBox(height: 16),
          Text(
            "Monday June 30, 2016",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "TRACK YOUR ORDER HERE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Text(
            "or",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          ContinueToPayButton()
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
