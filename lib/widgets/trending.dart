import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  final List trending;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trending.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Card(
              color: Colors.white,
              child: ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          fit: BoxFit.cover,
                          height: 170,
                          width: 170,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'Loading',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            HeightBox(10),
                            Container(
                              height: 22,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: trending[index]['vote_average'] <= 7.0
                                      ? Colors.blue
                                      : Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  trending[index]['vote_average'].toString() +
                                      ' Imdb',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
