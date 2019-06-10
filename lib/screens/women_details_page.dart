import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/product_details_page.dart';

class WomenDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(5),
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      childAspectRatio: 0.74,
      children: List.generate(9, (index) {
        if (index % 4 == 0) {
          return GridItem(
              "https://images.unsplash.com/photo-1534126416832-a88fdf2911c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
              "$index");
        } else if (index % 2 == 1) {
          return GridItem(
              "https://images.unsplash.com/photo-1518549002407-7c43c40cff45?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
              "$index");
        } else {
          return GridItem(
              "https://images.unsplash.com/photo-1530981785497-a62037228fe9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
              "$index");
        }
      }),
    );
  }
}

class GridItem extends StatelessWidget {
  final String url;
  final String tag;

  GridItem(this.url, this.tag);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetailsPage(url, tag)),
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                child: Hero(
                  tag: tag,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 2),
              child: Text(
                "Itme name",
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "\$100",
                    style: TextStyle(
                        color: Colors.blue[700], fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.green,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
