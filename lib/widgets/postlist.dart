import 'package:blog_app_2/models/postitem.dart';
import 'package:blog_app_2/widgets/postcard.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  const PostList({
    Key? key,
    required this.posts,
  }) : super(key: key);
  final List<PostItem> posts;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var post in widget.posts)
          PostCard(
            image: post.image,
            content: post.content,
            title: post.title,
          )
      ],
    );
  }
}
