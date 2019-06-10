import 'package:flutter/material.dart';

import 'order_success_page.dart';

class ConfirmationTab extends StatefulWidget {
  @override
  _ConfirmationTabState createState() => _ConfirmationTabState();
}

class _ConfirmationTabState extends State<ConfirmationTab> {
  List<CartItem> _cartList = List<CartItem>();

  _createCartList() {
    _cartList.add(CartItem(
        productImg:
            "https://images.unsplash.com/photo-1485145782098-4f5fd605a66b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        name: "Blue Striped Top",
        size: "S",
        color: "Red",
        price: "3299",
        qty: 3));
    _cartList.add(CartItem(
        productImg:
            "https://images.unsplash.com/photo-1529073895273-c171a25db46b?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
        name: "Round Neck Dresses",
        size: "S",
        color: "Black",
        price: "2299",
        qty: 1));
    _cartList.add(CartItem(
        productImg:
            "https://images.unsplash.com/photo-1506795660198-e95c77602129?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
        name: "Round Neck Dresses",
        size: "S",
        color: "White",
        price: "299",
        qty: 1));
  }

  @override
  void initState() {
    _createCartList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ShippingToWidget(),
          Container(
            height: 0.3,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              SizedBox(width: 16),
              Expanded(
                  child: Text(
                "Shipping to",
                style: TextStyle(color: Colors.grey[900], fontSize: 16),
              )),
              FlatButton(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 11,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(width: 16),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              CartItem item = _cartList[index];
              return CartItemWidget(item);
            },
            itemCount: _cartList.length,
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.grey[200],
              );
            },
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              SizedBox(width: 16),
              Expanded(
                  child: Text(
                "Payment summary",
                style: TextStyle(color: Colors.grey[900], fontSize: 16),
              )),
              FlatButton(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 11,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(width: 16),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "Order Total",
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                )),
                Text(
                  "₹ 11,196",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 0.3, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "Delivery Charge",
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                )),
                Text(
                  "Free",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(height: 0.3, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "Total Amount",
                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                )),
                Text(
                  "₹ 11,196",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
      bottomNavigationBar: ContinueToPayButton(() {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => OrderSuccessPage()),
        );
      }),
    );
  }
}

class ContinueToPayButton extends StatelessWidget {
  final Function onTap;

  ContinueToPayButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                  fontSize: 18),
            )),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class ShippingToWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                "Shipping to",
                style: TextStyle(color: Colors.grey[900], fontSize: 16),
              )),
              FlatButton(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 11,
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          Text(
            "John Smith",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
              "701, Block - B, Siddhi Vinayak Tower,\nAhmedabad - 380051, Gujarat, INDIA +91 8827987615",
              style: TextStyle(
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 0.3)),
              child: Image.network(
                item.productImg,
                fit: BoxFit.cover,
                width: 80,
                height: 85,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(item.name),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Size: ${item.size}"),
                    Text("Color: ${item.color}"),
                    Text("Qty: ${item.qty}"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "₹ ${item.price}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SizeWidget extends StatelessWidget {
  final String size;

  SizeWidget({
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300])),
      child: Text(
        size,
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class CartItem {
  String name;
  String size;
  String color;
  String price;
  String discountPrice;
  int qty;
  String productImg;

  CartItem({
    this.name,
    this.size,
    this.color,
    this.price,
    this.discountPrice,
    this.qty,
    this.productImg,
  });
}
