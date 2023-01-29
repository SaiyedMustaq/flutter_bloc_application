import 'package:flutter/material.dart';

import 'model/ApiResultModel.dart';

// ignore: must_be_immutable
class ArticleDetailPage extends StatelessWidget {
  Articles? article;

  ArticleDetailPage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cricket"),
      ),
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          Hero(
            tag: article!.urlToImage!,
            child: Image.network(
              article!.urlToImage!,
              errorBuilder: (context, error, stackTrace) {
                return CircleAvatar(
                  maxRadius: 32.0,
                  minRadius: 30.0,
                  child: Icon(Icons.error_rounded),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  );
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              article!.title!,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(5.0),
            child: Text(article!.publishedAt!),
          ),
          Text(article!.content!),
        ],
      ),
    );
  }
}
