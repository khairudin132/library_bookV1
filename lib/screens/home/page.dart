import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:library_book/components/components.dart';
import 'package:library_book/model/model.dart';

@RoutePage(name: 'HomePageRoute')
class HomePage extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const HomePage({super.key});

  // ------------------------------- PROPERTIES --------------------------------

  // ------------------------------- FIELDS ------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LibraryNavigationDrawer(),
      appBar: AppBar(
        elevation: .5,
        title: const Text('Library State'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Carousel(
              category: mostBorrowed,
              title: 'Most Borrowed',
            ),
            const SizedBox(height: 20),
            Carousel(
              category: mostPopular,
              title: 'Most Popular',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
