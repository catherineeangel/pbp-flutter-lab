import 'package:counter_7/function/fetch_watchlist.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:flutter/material.dart';

import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/pages/watchlistDetail.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 212, 155, 255),
        title: const Text(
          'My Watch List',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
      drawer: DrawerClass("My Watch List"),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 225, 243),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WatchListDetailPage(
                                title: futureWatchList[index].fields.title,
                                watched: futureWatchList[index].fields.watched,
                                rating: futureWatchList[index].fields.rating,
                                releasedDate: futureWatchList[index]
                                    .fields
                                    .releaseDate
                                    .toString(),
                                review: futureWatchList[index].fields.review,
                              ))),
                  child: Row(
                    children: [
                      Text(
                        "${snapshot.data![index].fields.title}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Checkbox(
                          checkColor: Colors.white,
                          activeColor: Color.fromARGB(255, 45, 15, 91),
                          value: futureWatchList[index].fields.watched,
                          onChanged: (bool? value) {
                            setState(() {
                              futureWatchList[index].fields.watched = value!;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
