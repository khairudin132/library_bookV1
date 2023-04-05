import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/router/router.gr.dart';

class BorrowedBookTile extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const BorrowedBookTile({super.key, required this.book});

  final BookModel book;

  // ------------------------------- PROPERTIES --------------------------------

  // ----------------------------- FIELDS --------------------------------------
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        book.image ?? '',
        fit: BoxFit.cover,
      ),
      title: Text(
        book.bookTitle ?? '',
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(book.authorName ?? ''),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.lightGreen,
      ),
      onTap: () => context.router.push(DetailBorrowedBookPageRoute(book: book)),
    );
  }
}
