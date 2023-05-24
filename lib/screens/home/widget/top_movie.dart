import 'package:flutter/material.dart';
import 'package:movie_list/screens/details/details.dart';

class TopMovie extends StatelessWidget {
  final List top;

  const TopMovie({Key key, this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, right: 5, left: 5, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Movies:',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: top.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      name: top[index]["title"],
                                      banner:
                                          "https://image.tmdb.org/t/p/w500" +
                                              top[index]["backdrop_path"],
                                      poster:
                                          "https://image.tmdb.org/t/p/w500" +
                                              top[index]["poster_path"],
                                      desc: top[index]["overview"],
                                      vote:
                                          top[index]["vote_average"].toString(),
                                      lunch: top[index]["release_date"],
                                    )));
                      },
                      child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          top[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                top[index]['title'] != null
                                    ? top[index]['title']
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
