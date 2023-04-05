import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:library_book/model/model.dart';
import 'package:toast/toast.dart';

@RoutePage(name: 'BookDescriptionPageRoute')
class BookDescriptionPage extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const BookDescriptionPage({super.key, required this.book});

  final BookModel book;

  // ------------------------------- PROPERTIES --------------------------------

  // ----------------------------- FIELDS --------------------------------------
  @override
  Widget build(BuildContext context) {
    final bool alreadyBorrowed = myBooks.contains(book);
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => {Navigator.of(context).pop()},
                  child: const Icon(Icons.arrow_back)),
              const SizedBox(height: 35),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: book,
                    child: Container(
                      width: 130,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(.5, .5),
                          )
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child:
                              Image.asset(book.image ?? '', fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.bookTitle ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          book.authorName ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Available: ${book.available.toString()}",
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 30),
                        alreadyBorrowed ? disabledButton() : clickButton(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Divider(
                height: 1,
                thickness: 1.5,
              ),
              const SizedBox(height: 35),
              const Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 15),
              Text(
                book.description ?? '',
                style: const TextStyle(
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
          myBooks.add(book);
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
          decoration: const BoxDecoration(
            color: Colors.lime,
          ),
          padding: const EdgeInsets.all(12.0),
          child: const Center(
            child: Text('BORROW',
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
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          padding: const EdgeInsets.all(12.0),
          child: const Center(
            child: Text('BORROW',
                style: TextStyle(
                    fontSize: 20, letterSpacing: 1.2, color: Colors.black38)),
          ),
        ),
      ),
    );
  }
}
