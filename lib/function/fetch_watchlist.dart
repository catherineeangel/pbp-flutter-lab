import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/model/watchlist.dart';

List<WatchList> futureWatchList = [];

Future<List<WatchList>> fetchMyWatchList() async {
  var url = Uri.parse('https://ruby-pbp.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<WatchList> myWatchList = [];
  for (var d in data) {
    if (d != null) {
      myWatchList.add(WatchList.fromJson(d));
      futureWatchList.add(WatchList.fromJson(d));
    }
  }
  return myWatchList;
}
