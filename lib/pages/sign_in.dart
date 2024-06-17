import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hepsi_burada/model/reqres_model.dart';
import 'package:hepsi_burada/pages/comment.dart';
import 'package:hepsi_burada/service/reqres_service.dart';
import 'package:hepsi_burada/widgets/tab_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController =
      TextEditingController(text: "byron.fields@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "Byron");
  List<Datum?> reqresList = [];
  ReqresUserService _reqresUserService = ReqresUserService();
  String buttonText = "Submit";
  Color buttonColor = Colors.black;
  bool checkAnswer = false;
  bool errorCheck = false;
  int numberCheck = 1;
  String errorText = "";
  @override
  void initState() {
    super.initState();
    _reqresUserService.reqresUserMethod().then((value) {
      if (value != null) {
        reqresList = value.data;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://wallpaperboat.com/wp-content/uploads/2020/05/08/40580/black-and-white-20.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                    const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.09,
                      margin: const EdgeInsets.only(left: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                        controller: emailController,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            ),
                            labelText: 'email',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 1.09,
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                        controller: passwordController,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            ),
                            labelText: 'password',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    checkAnswer
                        ? LoadingAnimationWidget.flickr(
                            leftDotColor: Colors.red,
                            rightDotColor: Colors.green,
                            // color: Colors.black,
                            size: 50,
                          )
                        : Text(""),
                    errorCheck
                        ? Text(
                            errorText,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          )
                        : Text(""),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor),
                        onPressed: () {
                          setState(() {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              for (int i = 0; i < reqresList.length; i++) {
                                if (reqresList[i]!.email ==
                                        emailController.text &&
                                    reqresList[i]!.firstName ==
                                        passwordController.text) {
                                  buttonColor = Colors.transparent;
                                  checkAnswer = true;
                                  errorCheck = false;
                                  numberCheck = 2;
                                  Timer(Duration(seconds: 4), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) => TabBarWidget(
                                                first_name:
                                                    reqresList[i]!.firstName,
                                                last_name:
                                                    reqresList[i]!.lastName,
                                                avatar:
                                                    reqresList[i]!.avatar))));
                                  });
                                }
                                if (numberCheck != 2) {
                                  errorCheck = true;
                                  errorText = "Parol ve ya emailiniz yanlisdir";
                                }
                              }
                            }
                          });
                        },
                        child: checkAnswer == false
                            ? Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w600),
                              )
                            : Text(
                                "Loading...",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w600),
                              ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
