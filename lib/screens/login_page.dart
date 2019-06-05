import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/sign_in.dart';
import 'package:flutter_ecommerce_app/screens/sign_up.dart';
import 'package:flutter_ecommerce_app/widget/logo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Widget> _children = List<Widget>();
  PageController _pageController = PageController();
  int selectedPage = 0;
  String titleTxt = 'Sign in';

  @override
  void initState() {
    super.initState();
    _children.add(SignInPage());
    _children.add(SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            titleRow(),
            Center(
              child: Text(
                titleTxt,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            strip(),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _children,
                onPageChanged: (page) {
                  showSelectedStrip(page);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  titleRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 36),
      child: Row(
        children: <Widget>[
          Logo(),
          Expanded(
            child: Container(),
          ),
          FlatButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ))
        ],
      ),
    );
  }

  strip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 2,
          width: 35,
          decoration: BoxDecoration(
              color: selectedPage == 0 ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 2,
          width: 35,
          decoration: BoxDecoration(
              color: selectedPage == 1 ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(4)),
        ),
      ],
    );
  }

  showSelectedStrip(int index) {
    if(index == 0){
      titleTxt = "Sign in";
    }else {
      titleTxt = "Sign up";
    }
    setState(() {
      selectedPage = index;
    });
  }
}
