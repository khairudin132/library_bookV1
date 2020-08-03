import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/screen/detail_borrowed_book_screen.dart';

class BorrowedBookTile extends StatefulWidget {
  Book _book;
  BorrowedBookTile(Book book) {
    _book = book;
  }
  @override
  _BorrowedBookTileState createState() => _BorrowedBookTileState(_book);
}

class _BorrowedBookTileState extends State<BorrowedBookTile> {
  Book book;

  _BorrowedBookTileState(Book book) {
    this.book = book;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            leading: Image.asset(
              book.image,
              fit: BoxFit.cover,
            ),
            title: Text(book.bookTitle, overflow: TextOverflow.ellipsis),
            subtitle: Text(book.authorName),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.lightGreen,
            ),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => DetailBorrowedBook(book)),
              )
            },
          ),
        ),
        Divider(
          height: 1,
          thickness: 1.5,
        ),
      ],
    );
  }
}
