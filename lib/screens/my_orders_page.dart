import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ItemRowWidget();
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 0.3,
          color: Colors.grey,
        );
      },
      itemCount: 5,
    );
  }
}

class ItemRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "08-Jun-2019",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  "Order id #SC12345",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          Text(
            "Dispatched",
            style: TextStyle(
              color: Colors.orange[400],
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Icon(
            Icons.navigate_next,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
