import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/api/fetch_news_api.dart';
import '../../services/api/model.dart';
import 'package:intl/intl.dart';

class NewsDisplayScreen extends StatefulWidget {
  const NewsDisplayScreen({super.key});

  @override
  State<NewsDisplayScreen> createState() => _NewsDisplayScreenState();
}

class _NewsDisplayScreenState extends State<NewsDisplayScreen> {
  late Article newsArt;
  final dateFormat = DateFormat('yyyy-MM-dd');
  // FetchNews fn = FetchNews();

  getNews() async {
    newsArt = await FetchNews.fetchNews();
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FetchNews.fetchNews(),
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
            // color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(top: 50.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueGrey),
                      ),
                      // focusedBorder: InputBorder.none,
                      suffixIcon: CupertinoButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        ),
                      ),
                      hintText: "Search news headlines",
                    ),
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 20,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
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
                                            style: DefaultTextStyle.of(context)
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
                                                  color:
                                                      Colors.blueGrey.shade300,
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
                                          snapshot
                                              .data!.articles[index].description
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
