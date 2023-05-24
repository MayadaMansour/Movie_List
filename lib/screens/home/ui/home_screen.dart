import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:movie_list/screens/home/widget/popular_movie.dart';
import 'package:movie_list/screens/home/widget/ternd_movie.dart';
import 'package:movie_list/screens/home/widget/top_movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List trendyMovie = [];
  List topMovie = [];
  List popularMovie = [];

  final String api_key = "70b7c391b11bbc6113f65a8c3c1c415b";
  final String acess_taken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MGI3YzM5MWIxMWJiYzYxMTNmNjVhOGMzYzFjNDE1YiIsInN1YiI6IjY0NmNjNzZkZDE4NTcyMDEwMTlhMWM0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HejHH1XAnBP20gxcRaNvQhbGe72BbkrIIB_7_L44JA4";

  @override
  void initState() {
    getMoview();
    super.initState();
  }

  getMoview() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, acess_taken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendMovie = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map popularResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendyMovie = trendMovie["results"];
      topMovie = topResult["results"];
      popularMovie = popularResult["results"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        shadowColor: Colors.grey,
        title: Text("🎬  Movie List "),
      ),

      body: ListView(

        children: [
          TrendyMovie(trend:trendyMovie),
          TopMovie(top: topMovie),
          PopularMovie(popular: popularMovie,)
        ],
      ),
    );
  }
}
