import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name, desc, banner, poster, vote, lunch;

  const DetailsScreen(
      {Key key,
      this.name,
      this.desc,
      this.banner,
      this.poster,
      this.vote,
      this.lunch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [

                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        banner,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  BackButton(color:Colors.white ),
                  Positioned(
                    bottom: 10,
                      child: Text(
                    " ⭐ Rate:" + vote,
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name!=null?name:"Loading",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text("Lunch_on:" + lunch,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 14),),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  height: 250,
                  width: 200,
                  child: Image.network(poster),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text(desc,style: TextStyle(color: Colors.white,fontSize: 15,),),
                    
                  ),
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
