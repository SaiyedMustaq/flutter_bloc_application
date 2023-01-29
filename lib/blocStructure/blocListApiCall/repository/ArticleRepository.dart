import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/ApiResultModel.dart';

class ArticleRepository {
  Future<List<Articles>> getArticles() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2021-08-30&sortBy=publishedAt&apiKey=b81df1d7c8c44eedb9659fd993ace9a2'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('JSON RESPONSE $data');
      List<Articles> articles = ApiResultModel.fromJson(data).articles!;
      return articles;
    } else {
      throw Exception();
    }
  }

  //Future<List<Articles>> getArticles();
}

// class ArticleRepositoryImpl implements ArticleRepository {
//   @override

// }
