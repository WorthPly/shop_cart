import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'checkout_tab_page.dart';

class CartListTabPage extends StatefulWidget {
  @override
  _CartListTabPageState createState() => _CartListTabPageState();
}

class _CartListTabPageState extends State<CartListTabPage> {
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
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
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
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CheckoutTabPage()));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
            height: 60,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "PLACE THIS ORDER   :   ₹12,495",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.22,
      child: Container(
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
            const SizedBox(
              width: 25,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizeWidget(
                  size: "${item.qty}",
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.remove,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {},
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete_outline,
          onTap: () {},
        ),
      ],
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
