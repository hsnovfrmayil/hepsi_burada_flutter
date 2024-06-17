import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hepsi_burada/pages/cart.dart';
import 'package:mj_image_slider/mj_image_slider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import '../model/product_model.dart';
import '../service/commerse_service.dart';
import 'comment.dart';

class HeroPage extends StatefulWidget {
  final int id;
  final String thumbnail;
  final double discountPercentage;
  final String description;
  final double rating;
  final List images;
  final String title;
  final String brand;

  HeroPage({
    super.key,
    required this.id,
    required this.thumbnail,
    required this.discountPercentage,
    required this.description,
    required this.rating,
    required this.images,
    required this.title,
    required this.brand,
  });

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  List<Product?> productList = [];
  ProductService productService = ProductService();
  int idMy = 1;
  String thumbnailMy = "";
  double discountPercentageMy = 1.0;
  String descriptionMy = "";
  double ratingMy = 1.0;
  List imagesMy = [];
  String titleMy = "";
  String brandMy = "";
  int clickCount = 0;
  String addtoCart = "";
  int addtoCartCount = 0;
  @override
  void initState() {
    super.initState();
    idMy = widget.id;
    thumbnailMy = widget.thumbnail;
    discountPercentageMy = widget.discountPercentage;
    descriptionMy = widget.description;
    ratingMy = widget.rating;
    imagesMy = widget.images;
    titleMy = widget.title;
    brandMy = widget.brand;
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
        backgroundColor: Colors.black,
      ),
      body: ListView(children: [
        Container(
            child: Column(
          children: [
            sizedBoxMethod(),
            Text(
              brandMy,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            sizedBoxMethod(),
            CarouselSlider.builder(
              options: CarouselOptions(height: 400.0),
              itemCount: imagesMy.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black)),
                  child: Image.network(
                    imagesMy[itemIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizedBoxMethod(),
            Text(
              "Title:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            Text(
              titleMy,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            sizedBoxMethod(),
            Text(
              "Description:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            Text(
              descriptionMy,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            sizedBoxMethod(),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height / 15,
              child: Container(
                  child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (clickCount > 0) {
                          clickCount--;
                        } else {
                          clickCount = 0;
                        }
                      });
                    },
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Text(
                    clickCount.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        clickCount++;
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (!addtoCart.contains(titleMy) && clickCount != 0) {
                        addtoCart = titleMy;
                        addtoCartCount = clickCount;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => CartPage(
                                addtoCartName: titleMy,
                                addtoCartCount: clickCount))));
                        print(titleMy);
                        print(clickCount);
                      }
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.shopping_basket,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              )),
            ),
            sizedBoxMethod(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < productList.length; i++) ...[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => HeroPage(
                                    id: productList[i]!.id,
                                    thumbnail: productList[i]!.thumbnail,
                                    discountPercentage:
                                        productList[i]!.discountPercentage,
                                    description: productList[i]!.description,
                                    rating: productList[i]!.rating,
                                    images: productList[i]!.images,
                                    title: productList[i]!.title,
                                    brand: productList[i]!.brand,
                                  ))));
                        },
                        child: Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            // height: MediaQuery.of(context).size.height / 3,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      productList[i]!.thumbnail,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4.5,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                        bottom: 20,
                                        right: 20,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        CommentPage())));
                                          },
                                          child: Icon(
                                            Icons.comment,
                                            color: Colors.blue,
                                            size: 40,
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        productList[i]!.price.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Text(
                                        productList[i]!
                                            .discountPercentage
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  productList[i]!.title,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    productList[i]!.description,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            sizedBoxMethod(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < productList.length; i++) ...[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => HeroPage(
                                    id: productList[i]!.id,
                                    thumbnail: productList[i]!.thumbnail,
                                    discountPercentage:
                                        productList[i]!.discountPercentage,
                                    description: productList[i]!.description,
                                    rating: productList[i]!.rating,
                                    images: productList[i]!.images,
                                    title: productList[i]!.title,
                                    brand: productList[i]!.brand,
                                  ))));
                        },
                        child: Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            // height: MediaQuery.of(context).size.height / 3,
                            child: Column(
                              children: [
                                Stack(children: [
                                  Image.network(
                                    productList[i]!.thumbnail,
                                    height: MediaQuery.of(context).size.height /
                                        4.5,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                      bottom: 20,
                                      right: 20,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      CommentPage())));
                                        },
                                        child: Icon(
                                          Icons.comment,
                                          color: Colors.blue,
                                          size: 40,
                                        ),
                                      ))
                                ]),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        productList[i]!.price.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Text(
                                        productList[i]!
                                            .discountPercentage
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  productList[i]!.title,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    productList[i]!.description,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            )
          ],
        )),
      ]),
    );
  }

  SizedBox sizedBoxMethod() {
    return SizedBox(
      height: 30,
    );
  }
}
