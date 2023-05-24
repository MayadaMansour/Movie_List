import 'package:flutter/material.dart';
import 'package:movie_list/screens/details/details.dart';

class TrendyMovie extends StatelessWidget {
  final List trend;

  const TrendyMovie({Key key, this.trend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending Movies:',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trend.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      name: trend[index]["title"],
                                      banner:
                                          "https://image.tmdb.org/t/p/w500" +
                                              trend[index]["backdrop_path"],
                                      poster:
                                          "https://image.tmdb.org/t/p/w500" +
                                              trend[index]["poster_path"],
                                      desc: trend[index]["overview"],
                                      vote: trend[index]["vote_average"]
                                          .toString(),
                                      lunch: trend[index]["release_date"],
                                    )));
                      },
                      child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trend[index]['poster_path'],
                                  ),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                trend[index]['title'] != null
                                    ? trend[index]['title']
                                    : 'Loading',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
