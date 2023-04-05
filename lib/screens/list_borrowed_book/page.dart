import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:library_book/components/borrowed_book_single_tile.dart';
import 'package:library_book/model/book.dart';

@RoutePage(name: 'ListBorrowedBookPageRoute')
class ListBorrowedBookPage extends StatelessWidget {
  const ListBorrowedBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Borrowed'),
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
