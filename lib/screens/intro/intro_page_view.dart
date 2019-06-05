import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/intro/data.dart';
import 'package:flutter_ecommerce_app/screens/intro/intro_page_item.dart';
import 'package:flutter_ecommerce_app/screens/intro/page_transformer.dart';

import '../login_page.dart';

class IntroPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment(0.0, 0.999),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight, // new
                end: Alignment.bottomLeft,
                colors: [
                  /*Color(0xFF5D26C1),*/
                  Colors.brown[100],
                  Colors.brown[100],
                ],
              ),
            ),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox.fromSize(
                    size: const Size.fromHeight(500.0),
                    child: PageTransformer(
                      pageViewBuilder: (context, visibilityResolver) {
                        return PageView.builder(
                          controller: PageController(viewportFraction: 0.85),
                          itemCount: sampleItems.length,
                          itemBuilder: (context, index) {
                            final item = sampleItems[index];
                            final pageVisibility =
                                visibilityResolver.resolvePageVisibility(index);
                            return IntroPageItem(
                              item: item,
                              pageVisibility: pageVisibility,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
