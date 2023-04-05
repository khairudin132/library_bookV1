import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/router/router.gr.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.title,
    required this.category,
  });

  final String title;
  final List<BookModel> category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _Tile(book: category[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const _Tile({required this.book});

  // ------------------------------- PROPERTIES --------------------------------
  final BookModel book;

  // ------------------------------- FIELDS ------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(BookDescriptionPageRoute(book: book)),
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: book,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(.5, .5),
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    book.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              book.bookTitle ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Text("by ${book.authorName}"),
          ],
        ),
      ),
    );
  }
}
