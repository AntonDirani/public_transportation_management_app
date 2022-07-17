import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/Models/news_model.dart';

class NewsAPI extends ChangeNotifier {
  List<News> allNews = [
    News(
        id: 1,
        head: 'خروج محطة الميدان عن الخدمة!',
        content:
            'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.')
  ];
}
