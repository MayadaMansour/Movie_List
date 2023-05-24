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
              height: 200,
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
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: 270,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trend[index]['backdrop_path'],
                                  ),fit: BoxFit.cover
                                ),
                              ),

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
