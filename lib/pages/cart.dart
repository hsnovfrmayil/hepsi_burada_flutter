import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../service/commerse_service.dart';

class CartPage extends StatefulWidget {
  String addtoCartName;
  int addtoCartCount;
  CartPage(
      {super.key, required this.addtoCartName, required this.addtoCartCount});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String addtoCartNameMy = "";
  int addtoCartCountMy = 0;
  List addCartNameList = [];
  List<Product?> productList = [];
  ProductService productService = ProductService();
  @override
  void initState() {
    super.initState();
    addtoCartNameMy = widget.addtoCartName;
    addtoCartCountMy = widget.addtoCartCount;
    addCartNameList.add(addCartNameList);

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "products in the basket",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            for (int i = 0; i < productList.length; i++) ...[
              if (productList[i]!.title.contains(addtoCartNameMy)) ...[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: ListTile(
                    leading: Image.network(productList[i]!.thumbnail),
                    title: Column(
                      children: [
                        Text(
                          "name:   " + productList[i]!.title,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "count:   " + addtoCartCountMy.toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )
              ]
            ]
          ],
        ),
      ),
    );
  }
}
