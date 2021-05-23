import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_serialization/constants/app_text/app_text.dart';
import 'dart:convert';

import 'package:json_serialization/model/for_second_page.dart';

class SecondHomePage extends StatefulWidget {
  @override
  _SecondHomePageState createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  //required fileds
  String url;
  var response;
  List data;
  bool isLoading = true;
  List<Comments> comment; //object of comments

  Future getCommenets() async {
    url = "http://jsonplaceholder.typicode.com/posts/1/comments";
    response = await http.get(url);
    data = json.decode(response.body);
    setState(() {
      comment = data.map((e) => Comments.fromJson(e)).toList();
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCommenets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          AppText.secondAppbarText,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: isLoading == true
          ? LinearProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    // title: Text(data[index]['name']), //raw data type
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment[index].name), //fixed data type
                        Text(comment[index].email),
                      ],
                    ),
                    subtitle: Text(comment[index].body),
                  ),
                );
              },
            ),
    );
  }
}
