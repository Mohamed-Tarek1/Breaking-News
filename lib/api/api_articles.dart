import 'package:breakingnews/api/all_articles.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'api_utilities.dart';
class ApiArticles {
  String allArticlesApi="$base_Api&apiKey=$api_Key";
  Future< List<Article> >fetchAllArticles() async{
    List <Article> news = List <Article>();
  var response = await http.get (allArticlesApi);

  if(response.statusCode ==200 ){
    var jsondata =jsonDecode(response.body);
    var data=jsondata["articles"];
    for( var item in data){

      Article article = Article(author: item["author"],title: item["title"],desc: item["description"],content: item["content"],
      date: item["publishedAt"],imageURL: item["urlToImage"],url: item["url"]);
      news.add(article);
    }
  }else{
    print("No");
  }
return news;
  }

}