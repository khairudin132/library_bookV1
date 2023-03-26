import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:toast/toast.dart';

class BookDescriptionPage extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const BookDescriptionPage({super.key, required this.book});

  final Book book;

  // ------------------------------- PROPERTIES --------------------------------

  @override
  State<BookDescriptionPage> createState() => _BookDescriptionPageState();
}

class _BookDescriptionPageState extends State<BookDescriptionPage> {
  // ----------------------------- FIELDS --------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    final bool alreadyBorrowed = myBooks.contains(widget.book);
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
                      tag: widget.book,
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
                            child: Image.asset(widget.book.image ?? '',
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.book.bookTitle ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.book.authorName ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Available: ${widget.book.available.toString()}",
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
                widget.book.description ?? '',
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
      child: ElevatedButton(
        onPressed: () {
          // TODO function terus borrow book tanpa bottom sheet
          myBooks.add(widget.book);
          Toast.show("You have successfully borrow this book",
              duration: Toast.lengthShort, gravity: Toast.bottom);
          DateTime todayBorrowBook = DateTime.now();
          // TODO
          // widget.book.borrowedDate = todayBorrowBook;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
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
      child: ElevatedButton(
        onPressed: () {
          Toast.show("You have borrowed this book",
              duration: Toast.lengthShort, gravity: Toast.bottom);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
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
