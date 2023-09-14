// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNewsView extends StatefulWidget {
  final String newsTitle;
  final String newsDetail;
  final String newsUploadedAt;
  final String authors;
  final String newsUrl;
  final String newsImage;

  const DetailNewsView({
    Key? key,
    required this.newsTitle,
    required this.newsDetail,
    required this.newsUploadedAt,
    required this.authors,
    required this.newsUrl,
    required this.newsImage,
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
          final link = widget.newsUrl;
          launchUrl(
            Uri.parse(link),
            mode: LaunchMode.inAppWebView,
          );
        },
        backgroundColor: Colors.blueGrey.shade300,
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
                  widget.newsTitle,
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
                  imageUrl: widget.newsImage,
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
                        DateTime.parse(widget.newsUploadedAt),
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
                      text: widget.authors,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.newsDetail,
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
