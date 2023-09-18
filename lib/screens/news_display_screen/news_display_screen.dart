import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/detail_news_view/detail_news_view.dart';
import 'package:news_app/services/api/fetch_news_api.dart';
import 'package:intl/intl.dart';
import 'package:news_app/services/auth_service/auth_service.dart';

import '../first_screen/first_screen.dart';

class NewsDisplayScreen extends StatefulWidget {
  const NewsDisplayScreen({super.key});

  @override
  State<NewsDisplayScreen> createState() => _NewsDisplayScreenState();
}

class _NewsDisplayScreenState extends State<NewsDisplayScreen> {
  String searchedWord = "";
  FetchNews fNews = FetchNews.instance;

  final dateFormat = DateFormat('yyyy-MM-dd');
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            searchText.clear();
          });
        },
        backgroundColor: Colors.blueGrey.shade300,
        splashColor: Colors.blueGrey.shade200,
        child: const Icon(
          Icons.refresh,
        ),
      ),
      body: FutureBuilder(
        future: searchText.text.isEmpty
            ? FetchNews.instance.fetchNews()
            : FetchNews.instance.searchNews(searchedWord),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(top: 50.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchText,
                          onSubmitted: (value) {
                            searchedWord = searchText.text;
                            fNews.searchNews(searchedWord);
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blueGrey),
                            ),
                            hintText: "Search news headlines",
                          ),
                          style: const TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          if (searchText.text.isNotEmpty) {
                            searchedWord = searchText.text;

                            setState(() {
                              fNews.searchNews(searchedWord);
                            });
                          }
                        },
                        child: const Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          authService.handleSignOut().then(
                                (value) => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FirstScreen(index: 0),
                                  ),
                                ),
                              );
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.red.shade800,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.articles.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailNewsView(
                                    newsArt: snapshot.data!,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: [
                                                TextSpan(
                                                  text: DateFormat('y-MM-dd')
                                                      .format(
                                                    DateTime.parse(
                                                      dateFormat.format(snapshot
                                                          .data!
                                                          .articles[index]
                                                          .publishedAt),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors
                                                        .blueGrey.shade300,
                                                  ),
                                                ),
                                                const WidgetSpan(
                                                  child: SizedBox(width: 10),
                                                ),
                                                TextSpan(
                                                  text: snapshot.data!
                                                      .articles[index].author,
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.articles[index].title
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            snapshot.data!.articles[index]
                                                .description
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      // flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.network(
                                          snapshot
                                              .data!.articles[index].urlToImage
                                              .toString(),
                                          fit: BoxFit.fitHeight,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
