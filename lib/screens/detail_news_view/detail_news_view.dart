// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/api/model.dart';

class DetailNewsView extends StatefulWidget {
  final Article newsArt;
  final int index;

  const DetailNewsView({
    Key? key,
    required this.newsArt,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailNewsView> createState() => _DetailNewsViewState();
}

class _DetailNewsViewState extends State<DetailNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 0.2,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final link = widget.newsArt.articles[widget.index].url;
          launchUrl(
            Uri.parse(link),
            mode: LaunchMode.inAppWebView,
          );
        },
        backgroundColor: Colors.blueGrey.shade300,
        splashColor: Colors.blueGrey.shade200,
        child: const Icon(Icons.turn_right),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  widget.newsArt.articles[widget.index].title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl: widget.newsArt.articles[widget.index].urlToImage!,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: DateFormat('y-MM-dd').format(
                        DateTime.parse(
                          widget.newsArt.articles[widget.index].publishedAt
                              .toString(),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blueGrey.shade300,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 10),
                    ),
                    TextSpan(
                      text: widget.newsArt.articles[widget.index].author,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.newsArt.articles[widget.index].content!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
