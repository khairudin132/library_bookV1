import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/screen/book_desc_screen.dart';

class Carousel extends StatelessWidget {
  @required
  final String title;
  @required
  final List<Book> category;

  Carousel({
    this.title,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 280,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookDesc(category[index])));
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: category[index],
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 5,
                                  offset: Offset(.5, .5),
                                )
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              category[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          category[index].bookTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                      Text("by ${category[index].authorName}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
