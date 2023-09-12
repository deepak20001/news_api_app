import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDisplayScreen extends StatelessWidget {
  const NewsDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.blueGrey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 50.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blueGrey),
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
                  itemCount: 15,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: [
                                        TextSpan(
                                          text: 'time',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.blueGrey.shade300,
                                          ),
                                        ),
                                        const WidgetSpan(
                                          child: SizedBox(width: 10),
                                        ),
                                        const TextSpan(
                                          text: 'source',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("News Heading"),
                                  const Text(
                                    "content",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 100,
                                padding: const EdgeInsets.all(10),
                                child: Image.asset("assets/icons/google.png"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
