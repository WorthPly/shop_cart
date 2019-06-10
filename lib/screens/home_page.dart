import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/cart_list_tab_page.dart';
import 'package:flutter_ecommerce_app/widget/logo.dart';

import '../animUtil.dart';
import 'bottom_tabs/home_tab_page.dart';
import 'my_profile_tab_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color bottomItemActiveColor = Colors.blue;
  Color bottomItemInActiveColor = Colors.grey[800];
  int bottomSelectedIndex = 0;
  AnimationController _controller;
  bool isOpen = false;
  List<String> navItems = List<String>();
  PageController _pageController = PageController();
  List<Widget> pages = List<Widget>();

  void _startAnimation(AnimationController _controller) {
    setState(() {
      isOpen = !isOpen;
    });
    _controller.fling(
        velocity: AnimUtil.isBackpanelVisible(_controller) ? -1.0 : 1.0);
  }

  Animation<Offset> _getSlideAnimation() {
    return Tween(begin: Offset(0.70, 0.0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  _addNavItems() {
    navItems.add("Men's Wear");
    navItems.add("Women's Wear");
    navItems.add("Accesories");
    navItems.add("Track order");
    navItems.add("Account details");
    navItems.add("Settings");
    navItems.add("Sign out");
  }
  
  _createPage(){
    pages.add(HomeTabPage());
    pages.add(HomeTabPage());
    pages.add(CartListTabPage());
    pages.add(HomeTabPage());
    pages.add(MyProfileTabPage());
  }

  void onPageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    _createPage();
    _addNavItems();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100), value: 1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: activityContainer,
    );
  }

  Widget activityContainer(BuildContext context, BoxConstraints constraint) {
    return Container(
      child: Stack(
        children: <Widget>[_backView(), _frontView()],
      ),
    );
  }

  _backView() {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: (MediaQuery.of(context).size.width / 100) * 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 130,
              child: ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      navItems[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    trailing: Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.white,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 0.2,
                    color: Colors.grey[100],
                  );
                },
                itemCount: navItems.length,
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  _frontView() {
    return SlideTransition(
      position: _getSlideAnimation(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(-5, 5), blurRadius: 16),
              BoxShadow(
                  color: Colors.black12, offset: Offset(-5, -5), blurRadius: 16)
            ]),
            duration: Duration(milliseconds: 200),
            height: isOpen
                ? MediaQuery.of(context).size.height - 130
                : MediaQuery.of(context).size.height,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Logo(),
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.grey[700],
                  ),
                  onPressed: () {
                    _startAnimation(_controller);
                  },
                ),
              ),
              body: PageView(
                controller: _pageController,
                children: pages,
                onPageChanged: onPageChanged,
              ),
              bottomNavigationBar: bottomNavigation(),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigation() {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.grey[800],
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: InkWell(
                  onTap: () => onTabTapped(0),
                  child: BottomBarItem(
                      bottomSelectedIndex == 0
                          ? bottomItemActiveColor
                          : bottomItemInActiveColor,
                      Icons.home,
                      "Home"))),
          Expanded(
              child: InkWell(
            onTap: ()  => onTabTapped(1),
            child: BottomBarItem(
                bottomSelectedIndex == 1
                    ? bottomItemActiveColor
                    : bottomItemInActiveColor,
                Icons.local_offer,
                "Hot offer"),
          )),
          Expanded(
              child: InkWell(
            onTap: ()  => onTabTapped(2),
            child: BottomBarItem(
                bottomSelectedIndex == 2
                    ? bottomItemActiveColor
                    : bottomItemInActiveColor,
                Icons.shopping_cart,
                "My Cart"),
          )),
          Expanded(
              child: InkWell(
                  onTap: ()  => onTabTapped(3),
                  child: BottomBarItem(
                      bottomSelectedIndex == 3
                          ? bottomItemActiveColor
                          : bottomItemInActiveColor,
                      Icons.search,
                      "Search"))),
          Expanded(
              child: InkWell(
            onTap: ()  => onTabTapped(4),
            child: BottomBarItem(
                bottomSelectedIndex == 4
                    ? bottomItemActiveColor
                    : bottomItemInActiveColor,
                Icons.person_outline,
                "Profile"),
          )),
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  BottomBarItem(this.color, this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
