import 'dart:convert';

import 'package:http/http.dart'  as http ;
import 'package:world_new_app/model/article_model.dart';

class NetWorkHelper{
  List<ArticleModel> news=[];

//  String url='https://newsapi.org/v2/top-headlines?country=us&apiKey=90c40f4307474c74bfabf5d685e10dc6';

  Future<void> getNews(String url) async{
    var response=await http.get(url);
    var json=jsonDecode(response.body);

    if(json['status']=='ok'){
      json['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          ArticleModel articleModel=ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content']
          );
          news.add(articleModel);
        }
      });
    }

  }
}