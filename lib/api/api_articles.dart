import 'package:breakingnews/api/all_articles.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'api_utilities.dart';
class ApiArticles {
  String allArticlesApi="$base_Api&apiKey=$api_Key";
  Future< List<AllArticles> >fetchAllArticles() async{
    List <AllArticles> news = List <AllArticles>();
  var response = await http.get (allArticlesApi);

  if(response.statusCode ==200 ){
    var jsondata =jsonDecode(response.body);
    var data=jsondata["articles"];
    for( var item in data){

      AllArticles article = AllArticles(author: item["author"],title: item["title"],desc: item["description"],content: item["content"],
      date: item["publishedAt"],imageURL: item["urlToImage"],url: item["url"]);
      news.add(item);
    }
  }
return news;
  }

}