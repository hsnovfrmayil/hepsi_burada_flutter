import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hepsi_burada/widgets/tab_bar.dart';
import '../model/product_model.dart';
import '../service/commerse_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product?> productList = [];
  ProductService productService = ProductService();
  String textValue = "";
  @override
  void initState() {
    super.initState();
    productService.getProductService().then((value) {
      setState(() {
        if (value != null) {
          productList = value.products;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: TextField(
              onChanged: (value) {
                setState(() {
                  textValue = value;
                });
              },
              style: TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    child: Text(
                      "Phones",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.laptop,
                      color: Colors.black,
                    ),
                    child: Text(
                      "Laptops",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.emoji_transportation,
                      color: Colors.black,
                    ),
                    child: Text(
                      "Groceries",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.emoji_transportation,
                      color: Colors.black,
                    ),
                    child: Text(
                      "Home D.",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(children: [
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        for (int i = 0; i < productList.length; i++) ...[
                          if (productList[i]!.category == "smartphones" &&
                              productList[i]!
                                  .title
                                  .trim()
                                  .toLowerCase()
                                  .contains(
                                      textValue.trim().toLowerCase())) ...[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: ListTile(
                                leading: Image.network(
                                  productList[i]!.thumbnail,
                                  width: 100,
                                  height: 200,
                                ),
                                title: Text(
                                  productList[i]!.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                trailing: RatingBar.builder(
                                  initialRating: productList[i]!.rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                            )
                          ]
                        ]
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        for (int i = 0; i < productList.length; i++) ...[
                          if (productList[i]!.category == "laptops" &&
                              productList[i]!
                                  .title
                                  .trim()
                                  .toLowerCase()
                                  .contains(
                                      textValue.trim().toLowerCase())) ...[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: ListTile(
                                leading: Image.network(
                                  productList[i]!.thumbnail,
                                  width: 100,
                                  height: 200,
                                ),
                                title: Text(
                                  productList[i]!.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                trailing: RatingBar.builder(
                                  initialRating: productList[i]!.rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                            )
                          ]
                        ]
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        for (int i = 0; i < productList.length; i++) ...[
                          if ((productList[i]!.category == "fragrances" ||
                                  productList[i]!.category == "skincare" ||
                                  productList[i]!.category == "groceries") &&
                              productList[i]!
                                  .title
                                  .trim()
                                  .toLowerCase()
                                  .contains(
                                      textValue.trim().toLowerCase())) ...[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: ListTile(
                                leading: Image.network(
                                  productList[i]!.thumbnail,
                                  width: 100,
                                  height: 200,
                                ),
                                title: Text(
                                  productList[i]!.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                trailing: RatingBar.builder(
                                  initialRating: productList[i]!.rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                            )
                          ]
                        ]
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        for (int i = 0; i < productList.length; i++) ...[
                          if (productList[i]!.category == "home-decoration" &&
                              productList[i]!
                                  .title
                                  .trim()
                                  .toLowerCase()
                                  .contains(
                                      textValue.trim().toLowerCase())) ...[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: ListTile(
                                leading: Image.network(
                                  productList[i]!.thumbnail,
                                  width: 100,
                                  height: 200,
                                ),
                                title: Text(
                                  productList[i]!.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                trailing: RatingBar.builder(
                                  initialRating: productList[i]!.rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                            )
                          ]
                        ]
                      ],
                    ),
                  ),
                ),
              ]))
            ],
          ),
        ));
  }
}
