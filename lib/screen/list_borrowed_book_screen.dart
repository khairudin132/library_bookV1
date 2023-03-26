import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/widget/borrowed_book_single_tile.dart';

class ListBorrowedBook extends StatefulWidget {
  @override
  _ListBorrowedBookState createState() => _ListBorrowedBookState();
}

class _ListBorrowedBookState extends State<ListBorrowedBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Borrowed'),
      ),
      body: ListView.builder(
        itemCount: myBooks.length,
        itemBuilder: (BuildContext context, int index) {
          return BorrowedBookTile(book: myBooks[index]);
        },
      ),
    );
  }
}
