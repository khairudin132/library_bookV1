import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/widget/bottom_sheet.dart';
import 'package:library_book/widget/carousel.dart';
import 'package:toast/toast.dart';

Book bookDesc = Book();
Carousel bookCategory = Carousel();

class BookDesc extends StatefulWidget {
  Book _book;

  BookDesc(Book book) {
    _book = book;
  }

  @override
  _BookDescState createState() => _BookDescState(_book);
}

class _BookDescState extends State<BookDesc> {
  Book book;

  _BookDescState(Book book) {
    this.book = book;
  }

  @override
  Widget build(BuildContext context) {
    final bool alreadyBorrowed = myBooks.contains(book);
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => {Navigator.of(context).pop()},
                  child: Icon(Icons.arrow_back)),
              SizedBox(height: 35),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: book,
                      child: Container(
                        width: 130,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              offset: Offset(.5, .5),
                            )
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(book.image, fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.bookTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(
                            book.authorName,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Available: ${book.available.toString()}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 30),
                          alreadyBorrowed ? disabledButton() : clickButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Divider(
                height: 1,
                thickness: 1.5,
              ),
              SizedBox(height: 35),
              Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                bookDesc.description,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget clickButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: RaisedButton(
        onPressed: () {
          //function terus borrow book tanpa bottom sheet
          myBooks.add(book);
          Toast.show("You have successfully borrow this book", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          DateTime todayBorrowBook = DateTime.now();
          book.borrowedDate = todayBorrowBook;
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lime,
          ),
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: const Text('BORROW',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.2,
                )),
          ),
        ),
      ),
    );
  }

  Widget disabledButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: RaisedButton(
        onPressed: () {
          Toast.show("You have borrowed this book", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: const Text('BORROW',
                style: TextStyle(
                    fontSize: 20, letterSpacing: 1.2, color: Colors.black38)),
          ),
        ),
      ),
    );
  }
}
