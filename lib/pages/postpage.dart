import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white.withOpacity(0),
              elevation: 0.0,
              expandedHeight: 500,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  image,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: 10,
              ),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                content,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'arial',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
