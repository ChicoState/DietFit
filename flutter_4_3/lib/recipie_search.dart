import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'main.dart';
import 'package:http/http.dart' as http;

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class RecipieSearch extends StatelessWidget {
  Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 1));
  return List.generate(search.length, (int index) {
    return Post(
      "Title : $search",
      "Description :$search",
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bamboo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
              );
            },
          ),
        ),
      ),
    );
  }
}