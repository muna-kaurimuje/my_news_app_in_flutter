import 'dart:convert';

import 'package:my_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{

    String url = "http://newsapi.org/v2/top-headlines?country=sa&category=business&apiKey=24bb5d40f1ea4a8a9b42773daed49f90";

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);

  if(jsonData['status'] == "ok"){
    jsonData["articles"].forEach((element){

      if(element["urlToImage"] != null && element['description'] != null){

        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element["context"]
        );

        news.add(articleModel);
      }

    });
  }

  }
  
}