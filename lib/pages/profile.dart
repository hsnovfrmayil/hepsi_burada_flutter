import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  String first_name;
  String last_name;
  String avatar;
  ProfilePage({
    super.key,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String first_nameMy = "";
  String last_nameMy = "";
  String avatarMy = "";
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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    first_nameMy,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    last_nameMy,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              ClipOval(
                child: Image.network(
                  avatarMy,
                  width: 100,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // GestureDetector(
              //   onTap: () {},
              //   child: Icon(
              //     Icons.chevron_right_rounded,
              //     color: Colors.white,
              //     size: 50,
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                title: Text(
                  "Basket",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                trailing: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                trailing: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                trailing: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
