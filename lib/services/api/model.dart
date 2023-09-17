import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

class Article {
  String status;
  int totalResults;
  List<ArticleElement> articles;

  Article({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleElement>.from(
            json["articles"].map((x) => ArticleElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class ArticleElement {
  String? author;
  String? title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  ArticleElement({
    this.author,
    this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleElement.fromJson(Map<String, dynamic> json) => ArticleElement(
        author: json["author"] ?? "--",
        title: json["title"] ?? "--",
        description: json["description"] ?? "--",
        url: json["url"],
        urlToImage: json["urlToImage"] ??
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWrPAEh2XvPLLY8vqO_cA0RhBftWUTHIRoRQ",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
}
