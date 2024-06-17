import 'package:flutter/material.dart';
import 'package:hepsi_burada/model/comment.dart';
import 'package:hepsi_burada/model/commerse_user.dart';
import 'package:hepsi_burada/service/commerse_service.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  CommentSevice _commentService = CommentSevice();
  List<Comment?> commentList = [];
  @override
  void initState() {
    super.initState();
    _commentService.getCommentMethod().then((value) {
      setState(() {
        commentList = value!.comments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Comments"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < commentList.length; i++) ...[
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.black)),
                height: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Icon(Icons.person),
                        ),
                        Text(
                          commentList[i]!.user.username +
                              commentList[i]!.user.id.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        commentList[i]!.body,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
