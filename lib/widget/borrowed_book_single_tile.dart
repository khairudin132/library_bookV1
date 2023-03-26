import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';

import '../screen/detail_borrowed_book_screen.dart';

class BorrowedBookTile extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const BorrowedBookTile({super.key, required this.book});

  final Book book;

  // ------------------------------- PROPERTIES --------------------------------

  @override
  State<BorrowedBookTile> createState() => _BorrowedBookTileState();
}

class _BorrowedBookTileState extends State<BorrowedBookTile> {
  // ----------------------------- FIELDS --------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        widget.book.image ?? '',
        fit: BoxFit.cover,
      ),
      title: Text(
        widget.book.bookTitle ?? '',
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(widget.book.authorName ?? ''),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.lightGreen,
      ),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailBorrowedBookPage(book: widget.book)),
        )
      },
    );
  }
}
