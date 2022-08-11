import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:pub_transport_01/Models/news_model.dart';

class NewsDetails extends StatelessWidget {
  static String id = 'newsDetails';
  final int index;
  final News news;

  const NewsDetails({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          centerTitle: true,
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text(
            'News',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2c8e82),
                Color(0xFF42dc8f),
              ])),
      body: NewsDetailsBody(news, index),
    );
  }
}

class NewsDetailsBody extends StatelessWidget {
  final int index;
  final News news;
  NewsDetailsBody(this.news, this.index);
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            height: mediaHeight / 3,
            width: mediaWidth / 1,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/news.png'))),
          ),
          Text(news.head!,
              style: GoogleFonts.montserrat(
                  fontSize: 28, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Text(news.content!,
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w300)),
          )
        ],
      ),
    );
  }
}
