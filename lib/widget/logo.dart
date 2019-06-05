import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Icon(
            Icons.card_travel,
            color: Colors.green,
          ),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue,
              )),
        ),
        SizedBox(
          width: 10,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Shop",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: "Cart",
              style: TextStyle(
                color: Colors.green,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
