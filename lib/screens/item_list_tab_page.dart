import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/women_details_page.dart';

import '../animUtil.dart';

class ItemListTabPage extends StatefulWidget {
  @override
  _ItemListTabPageState createState() => _ItemListTabPageState();
}

class _ItemListTabPageState extends State<ItemListTabPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  bool isOpen = false;

  void _startAnimation(AnimationController _controller) {
    _controller.fling(
        velocity: AnimUtil.isBackpanelVisible(_controller) ? -1.0 : 1.0);
  }

  Animation<Offset> _getSlideAnimation() {
    return Tween(begin: Offset(0.0, 1.0), end: Offset(0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100), value: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[500],
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Women's wear",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings_input_component,
                color: Colors.grey,
              ),
              onPressed: () {
                _startAnimation(_controller);
              },
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.green,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "Bags",
              ),
              Tab(
                text: "Bags",
              ),
              Tab(
                text: "Bags",
              ),
              Tab(
                text: "Bags",
              ),
              Tab(
                text: "Bags",
              ),
              Tab(
                text: "Bags",
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            TabBarView(children: [
              WomenDetailsPage(),
              Center(
                child: Text("Tabt 1"),
              ),
              Center(
                child: Text("Tabt 1"),
              ),
              Center(
                child: Text("Tabt 1"),
              ),
              Center(
                child: Text("Tabt 1"),
              ),
              Center(
                child: Text("Tabt 1"),
              ),
            ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _getSlideAnimation(),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0.0, -1.0))
                  ]),
                  height: (MediaQuery.of(context).size.height / 100) * 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 5, 5, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Filter by",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 120,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return getFilterTypeItem(index);
                                },
                                itemCount: 5,
                              ),
                              color: Colors.grey[200],
                            ),
                            Expanded(
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return getFilterTypeSelectionItem(index);
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 0.3,
                                    color: Colors.grey,
                                  );
                                },
                                itemCount: 5,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Colors.grey[900],
                              padding: const EdgeInsets.all(20),
                              width: 120,
                              child: Text(
                                "CLEAR ALL",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                color: Colors.blue,
                                child: Text(
                                  "APPLY FILTERS",
                                  textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFilterTypeItem(int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
      child: Text("Test"),
    );
  }

  Widget getFilterTypeSelectionItem(int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 20),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: 18,
          ),
          const SizedBox(
            width: 16,
          ),
          Text("All")
        ],
      ),
    );
  }
}

class _DiamondBorder extends ShapeBorder {
  const _DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
