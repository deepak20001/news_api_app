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
  Source source;
  String? author;
  String? title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  ArticleElement({
    required this.source,
    this.author,
    this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleElement.fromJson(Map<String, dynamic> json) => ArticleElement(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "--",
        title: json["title"] ?? "--",
        description: json["description"] ?? "--",
        url: json["url"],
        urlToImage: json["urlToImage"] ??
            "https://png.pngtree.com/element_our/20190601/ourmid/pngtree-web-ui-design-2-5d-icon-loading-ai-vector-png-free-image_1332562.jpg",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
