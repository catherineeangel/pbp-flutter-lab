import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/drawer.dart';

class WatchListDetailPage extends StatelessWidget {
  final String title;
  final bool watched;
  final int rating;
  final String releasedDate;
  final String review;

  const WatchListDetailPage(
      {Key? key,
      required this.title,
      required this.watched,
      required this.rating,
      required this.releasedDate,
      required this.review})
      : super(key: key);

  showWatched() {
    if (watched == true) {
      return Text(
        "Watched: watched",
        style: const TextStyle(fontSize: 15),
      );
    } else {
      return Text(
        "Watched: not watched",
        style: const TextStyle(fontSize: 15),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 212, 155, 255),
          title: const Text(
            'Detail',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ),
        drawer: DrawerClass("Detail"),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black),
                ),
              ),
              Text(
                "Released Date: " + releasedDate,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                "Rating: " + rating.toString() + "/5",
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 15),
              ),
              SizedBox(height: 5),
              showWatched(),
              SizedBox(height: 5),
              Text(
                "Review: " + review,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 15),
              ),
            ],
          ),
        ));
  }
}
