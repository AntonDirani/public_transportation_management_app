import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/API/news_api.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:pub_transport_01/Components/my_drawer.dart';
import '../Components/search_bar.dart';
import 'package:pub_transport_01/Models/news_model.dart';

import 'news_details.dart';

class NewsScreen extends StatefulWidget {
  static String id = 'newsScreen';

  @override
  State<NewsScreen> createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My News',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
      /*NewGradientAppBar(
            centerTitle: true,
            //backgroundColor: Color(0xFF00D3A0),
            elevation: 0,

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                */ /*stops: [
                  0.02,
                  0.5,
                ],*/ /*
                colors: [
                  Color(0xFF2c8e82),
                  Color(0xFF42dc8f),
                ])),*/
      ,
      body: NewsBody(),
    );
  }
}

class NewsBody extends StatefulWidget {
  @override
  State<NewsBody> createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  late List<News> news = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    Provider.of<NewsAPI>(context, listen: false).fetchNews();
    news = Provider.of<NewsAPI>(context, listen: false).allNews;
  }

  @override
  void didChangeDependencies() {
    news = Provider.of<NewsAPI>(context, listen: true).allNews;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context1) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 22),
              height: MediaQuery.of(context).size.height / 6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.02,
                        0.5,
                      ],
                      colors: [
                        Color(0xFF2c8e82),
                        Color(0xFF42dc8f),
                      ])),
            ),
            Positioned(
              child: SearchBar(),
              bottom: 0,
              left: 0,
              right: 0,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          //Listview
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              //shrinkWrap: true,
              itemCount: news.length,
              itemBuilder: (context, index) {
                final news1 = news[index];
                return buildNews(news1, context1, index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget SearchBar() => SearchWidget(
        text: query,
        hintText: 'Search for a news..',
        onChanged: searchNews,
      );

  void searchNews(String query) {
    final news =
        Provider.of<NewsAPI>(context, listen: false).allNews.where((news) {
      final nameLower = news.head?.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower!.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.news = news;
    });
  }

  Widget buildNews(News news, BuildContext context, int index) {
    return ListTile(
        leading: SvgPicture.asset(
          'assets/newsIcon.svg',
          color: mainColor,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(
          news.head!,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Click to see details'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NewsDetails(
              index: index,
              news: news,
            );
          }));
        });
  }
}
