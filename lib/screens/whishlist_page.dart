import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget {
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
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
    return ListView.separated(
      itemBuilder: (context, index) {
        return CartItemWidget(_cartList[index]);
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 0.3,
          color: Colors.grey,
        );
      },
      itemCount: _cartList.length,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
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
                Row(
                  children: <Widget>[
                    Expanded(child: Text(item.name)),
                    Text(
                      "In stock",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "₹ ${item.price}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    OutlineButton(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "ADD TO BAG",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
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
