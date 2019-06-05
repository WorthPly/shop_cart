import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widget/TriangleClipper.dart';
import 'package:flutter_ecommerce_app/widget/TriangleClipper2.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: PageView(
                    children: <Widget>[
                      Image.network(
                        "https://images.unsplash.com/photo-1526178613552-2b45c6c302f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                        fit: BoxFit.cover,
                      )
                    ],
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment(0.0, -1.0),
                        begin: Alignment(0.0, -0.4),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                    width: double.infinity,
                    height: 25,
                    child: Center(
                      child:
                          DotsIndicator(dotsCount: 3, position: currentIndex),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              color: const Color(0xFFF1F1F1),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          "https://images.unsplash.com/photo-1519457431-44ccd64a579b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80",
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: tagContainer("Kids wear"),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              "https://images.unsplash.com/photo-1557409710-aaabc9ed973f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: tagContainer("Women's wear"),
                              ),
                            )
                          ],
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                            child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              "https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=367&q=80",
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: tagContainer("Men's wear"),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tagContainer(String text) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(1),
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF333333),
              child: Center(
                  child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: leftTriangle(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: rightTriangle(),
          ),
        ],
      ),
    );
  }

  Widget leftTriangle() {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        height: 12,
        width: 12,
        color: const Color(0xFF4EACEC),
      ),
    );
  }

  Widget rightTriangle() {
    return ClipPath(
      clipper: TriangleClipper2(),
      child: Container(
        height: 12,
        width: 12,
        color: const Color(0xFF4CC24D),
      ),
    );
  }
}
