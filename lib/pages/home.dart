import 'package:flutter/material.dart';

import 'package:hepsi_burada/model/product_model.dart';
import 'package:hepsi_burada/pages/comment.dart';
import 'package:hepsi_burada/pages/hero.dart';
import 'package:hepsi_burada/pages/profile.dart';
import 'package:hepsi_burada/service/commerse_service.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

import '../model/reqres_model.dart';
import '../service/reqres_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product?> productList = [];
  ProductService productService = ProductService();
  List imageList = [];
  List<Datum?> reqresList = [];
  ReqresUserService _reqresUserService = ReqresUserService();
  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
    'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
    'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
    'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
    'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
    'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  ];
  @override
  void initState() {
    super.initState();
    productService.getProductService().then((value) {
      setState(() {
        if (value != null) {
          productList = value.products;
        }
      });
      _reqresUserService.reqresUserMethod().then((value) {
        setState(() {
          if (value != null) {
            reqresList = value.data;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 16),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.orange),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Row(
                      children: const [
                        Icon(Icons.euro),
                        Flexible(
                          child: Text(
                            "without extra charge",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: const [
                        Icon(Icons.euro),
                        Flexible(
                          child: Text(
                            "without extra charge",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: const [
                        Icon(Icons.euro),
                        Flexible(
                          child: Text(
                            "without extra charge",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FanCarouselImageSlider(
            sliderHeight: MediaQuery.of(context).size.height / 2,
            imagesLink: sampleImages,
            isAssets: false,
            autoPlay: true,
          ),
          // Expanded(
          //   child: ListView.builder(itemBuilder: ((context, index) {
          //     return Container(
          //       width: MediaQuery.of(context).size.width / 2.5,
          //       child: Text("hello"),
          //     );
          //   })),
          // ),
          SizedBox(
            height: 50,
          ),
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
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
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
          ),
          SizedBox(
            height: 50,
          ),
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
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
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
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    "Yeni Kampaniyalar",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ),
                  for (int i = 0; i < reqresList.length; i++) ...[
                    Stack(children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Image.network(
                          reqresList[i]!.avatar,
                          width: MediaQuery.of(context).size.width - 40,
                          height: MediaQuery.of(context).size.height / 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          right: 50,
                          top: 100,
                          child: Container(
                            child: Column(children: [
                              Text(
                                "30%",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue),
                              ),
                              Text(
                                "Endirim",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue),
                              ),
                              Text(
                                "Xususi Kampaniyalar",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue),
                              ),
                            ]),
                          ))
                    ])
                  ]
                ],
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
