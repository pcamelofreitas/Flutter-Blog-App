import 'package:blog_app_2/pages/postpage.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostPage(
                    content: content,
                    image: image,
                    title: title,
                  ),
                ),
              );
            },
            child: Image.network(
              image,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.favorite),
                      SizedBox(width: 10),
                      Icon(Icons.share),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
