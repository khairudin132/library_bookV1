import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/widget/carousel.dart';
import 'package:library_book/widget/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: .5,
        title: Text('Library State'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 40),
            Carousel(
              category: mostBorrowed,
              title: 'Most Borrowed',
            ),
            SizedBox(height: 20),
            Carousel(
              category: mostPopular,
              title: 'Most Popular',
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
