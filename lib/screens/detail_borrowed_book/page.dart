import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../model/model.dart';

@RoutePage(name: 'DetailBorrowedBookPageRoute')
class DetailBorrowedBookPage extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const DetailBorrowedBookPage({super.key, required this.book});

  final BookModel book;

  // ------------------------------- PROPERTIES --------------------------------

  // ------------------------------- FIELDS ------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    // TODO
    //format today date
    // String _todayBorrowDate =
    // DateFormat("E, dd-MM-yyyy").format(book.borrowedDate);

    // TODO
    //add one month
    // DateTime _addOneMonthReturnDate = book.borrowedDate.add(Duration(days: 30));
    // book.returnDate = _addOneMonthReturnDate;

    // TODO
    //format return date
    // String _returnDate = DateFormat("E, dd-MM-yyyy").format(book.returnDate);

    // TODO
    //remaining days
    // Duration difference = book.returnDate.difference(book.borrowedDate);
    // book.remainingDays = difference.inDays.toString();
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO : cari camne nak load page list yg dh update terus(force reload)
              GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: const Icon(Icons.arrow_back)),
              const SizedBox(height: 35),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.bookTitle ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          book.authorName ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
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
              const SizedBox(height: 30),
              const Text(
                'Borrowed Date:',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 15),
              // TODO
              const Text(
                // _todayBorrowDate,
                '',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              const SizedBox(height: 30),
              const Text(
                'Return Date:',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 15),
              // TODO
              const Text(
                // _returnDate,
                '',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              const SizedBox(height: 30),
              const Text(
                'Remaining Days:',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 15),
              Text(
                '${book.remainingDays} days left',
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              const Expanded(child: SizedBox(height: 35)),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(
                  onPressed: () {
                    myBooks.remove(book);
                    Toast.show("Thank you!",
                        duration: Toast.lengthShort, gravity: Toast.bottom);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.lime,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: const Center(
                      child: Text('RETURN',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.2,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
