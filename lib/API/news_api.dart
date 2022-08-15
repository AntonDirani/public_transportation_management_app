import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/Models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:http/http.dart' as http;

class NewsAPI extends ChangeNotifier {
  String? _token;
  List<News> allNews = [
    /*News(
        id: 1,
        head: 'خروج محطة الميدان عن الخدمة!',
        content:
            'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.')*/
  ];

  Future<void> fetchNews() async {
    print('object');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    final url = Url + 'news';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-ACCESS-TOKEN': '$_token'
    });
    final data = jsonDecode(response.body) as List<dynamic>;
    final List<News> loadedNews = [];
    print(data);
    for (int j = 0; j < data.length; j++) {
      final decoded = data;
      loadedNews
          .add(News(head: decoded[j]['title'], content: decoded[j]['content']));
      // allNews.add(decoded[j]);
    }
    allNews = loadedNews;
    notifyListeners();
  }
}
