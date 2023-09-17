import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/services/api/model.dart';

class FetchNews {
  FetchNews._();
  static FetchNews instance = FetchNews._();

  Future<Article> fetchNews() async {
    try {
      const apiKey = "a8665116b78c471e9a779187467735a0";
      final res = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
        ),
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data["status"] != "ok") {
          throw Exception("An unexpected error occured");
        }
        // var articles = data["articles"];
        Article article = Article.fromJson(data);

        return article;
      } else {
        throw Exception("Couldn't able to fetch the news!!");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Article> searchNews(String searchedWord) async {
    try {
      const apiKey = "a8665116b78c471e9a779187467735a0";
    final res = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/everything?q=$searchedWord&apiKey=$apiKey"),
    );

    if(res.statusCode == 200) {
      var data = jsonDecode(res.body);
      
      // print("yes1");
      Article searchedArticle = Article.fromJson(data);
      // print("yes2");
      // print(searchedArticle.articles[0].title);
      return searchedArticle;
    } else {
      throw Exception("Couldn't able to fetch the news!!");
    }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
