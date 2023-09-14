import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/services/api/model.dart';

class FetchNews {
  static Future<Article> fetchNews() async {
    try {
      String apiKey = "a8665116b78c471e9a779187467735a0";
      final res = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
        ),
      );

      var data = jsonDecode(res.body);

      if (data["status"] != "ok") {
        throw "An unexpected error occured";
      }
      // var articles = data["articles"];
      Article article = Article.fromJson(data);

      return article;
    } catch (e) {
      throw e.toString();
    }
  }
}
