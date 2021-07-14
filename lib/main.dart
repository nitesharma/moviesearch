import 'package:flutter/material.dart';
import 'package:moviesearch/widgets/trending.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  final String apikey = 'eef9a78fcf2b1689dd792dd98bec13c6';
  final readaccestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZWY5YTc4ZmNmMmIxNjg5ZGQ3OTJkZDk4YmVjMTNjNiIsInN1YiI6IjYwZWQ1YjU5OGMzMTU5MDAyOTg5ZTFhYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Idfo8g-r_d5gp32GcStWh-4pQLz5VenD-KK3ZGBNyjo';

  @override
  void initState() {
    loadmovies();

    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccestoken));

    logConfig:
    ConfigLogger(showLogs: true, showErrorLogs: true);

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();

    setState(() {
      trendingMovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                15.heightBox,
                Container(
                  height: 55,
                  padding: EdgeInsets.all(10),
                  //margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    // borderRadius: BorderRadius.circular(12)
                  ),

                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search for Movies"),
                  ),
                ),
                20.heightBox,
                Expanded(
                    child: TrendingMovies(
                  trending: trendingMovies,
                )),
              ],
            ),
          )),
    );
  }
}
