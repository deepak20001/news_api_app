import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/services/api/model.dart';

class FetchNews {

  FetchNews._(); 


  static FetchNews indstance = FetchNews._(); 


   Future<Article> fetchNews() async {
    try {
      String apiKey = "a8665116b78c471e9a779187467735a0";
      final res = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
        ),
      );
      if(res.statusCode == 200) {
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
      throw e.toString();
    }
  }
}
