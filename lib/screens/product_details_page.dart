import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  String url;
  String tag;

  ProductDetailsPage(this.url, this.tag);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<Color> colorList = List<Color>();
  List<SizeModel> sizeList = List<SizeModel>();

  _createColorList() {
    colorList.add(Colors.green);
    colorList.add(Colors.orange);
    colorList.add(Colors.pink);
    colorList.add(Colors.blueAccent);
    colorList.add(Colors.cyanAccent);
  }

  _createSizeList() {
    sizeList.add(SizeModel(size: "S", isSelected: false));
    sizeList.add(SizeModel(size: "M", isSelected: false));
    sizeList.add(SizeModel(size: "L", isSelected: true));
    sizeList.add(SizeModel(size: "XL", isSelected: false));
    sizeList.add(SizeModel(size: "XXL", isSelected: false));
  }

  @override
  void initState() {
    _createColorList();
    _createSizeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Hero(
                      tag: widget.tag,
                      child: Image.network("https://images.unsplash.com/photo-1452188530871-d44f2eaf1f3a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80", fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Red Blue Striped Top",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "₹ 3299",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  child: Center(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColorIcon(
                            color: colorList[index],
                            isSelected: index == 2,
                          ),
                        );
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: colorList.length,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  child: Center(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        SizeModel item = sizeList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizeWidget(
                            size: item.size,
                            isSelected: item.isSelected,
                          ),
                        );
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: sizeList.length,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.grey[600],
                ),
                onPressed: () {},
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomView(),
    );
  }
}

class BottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.lightBlue[900],
            padding: const EdgeInsets.all(20),
            width: 120,
            child: Text(
              "Qty: 2",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(20),
              width: 120,
              child: Text(
                "ADD TO CART",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ColorIcon extends StatelessWidget {
  final Color color;
  final bool isSelected;

  ColorIcon({this.color, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(50))
          : BoxDecoration(),
      padding: const EdgeInsets.all(2),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 18,
        child: isSelected
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )
            : Container(),
      ),
    );
  }
}

class SizeWidget extends StatelessWidget {
  final String size;
  final bool isSelected;

  SizeWidget({this.size, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300])),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[900],
        ),
      ),
    );
  }
}

class SizeModel {
  String size;
  bool isSelected;

  SizeModel({this.size, this.isSelected});
}
