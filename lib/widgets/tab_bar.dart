import 'package:flutter/material.dart';
import 'package:hepsi_burada/pages/cart.dart';
import 'package:hepsi_burada/pages/categories.dart';
import 'package:hepsi_burada/pages/home.dart';
import 'package:hepsi_burada/pages/profile.dart';
import 'package:hepsi_burada/pages/search.dart';

class TabBarWidget extends StatefulWidget {
  String first_name;
  String last_name;
  String avatar;
  TabBarWidget(
      {super.key,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _index = 0;
  List<Widget> pageList = [
    HomePage(),
    CategoriesPage(),
    CartPage(addtoCartName: "", addtoCartCount: 0),
    ProfilePage(first_name: "", last_name: "", avatar: ""),
  ];
  String first_nameMy = "";
  String last_nameMy = "";
  String avatarMy = "";
  Widget newWidget = const HomePage();
  @override
  void initState() {
    super.initState();
    first_nameMy = widget.first_name;
    last_nameMy = widget.last_name;
    avatarMy = widget.avatar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => SearchPage())));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
        title: Container(
          width: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                "hepsiburada",
                style: TextStyle(color: Colors.orange[500]),
              ),
              const Text(
                "global",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: _index == 3
          ? ProfilePage(
              first_name: first_nameMy,
              last_name: last_nameMy,
              avatar: avatarMy,
            )
          : newWidget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
            newWidget = pageList[_index];
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
