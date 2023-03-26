import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../model/book.dart';

class DetailBorrowedBookPage extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const DetailBorrowedBookPage({super.key, required this.book});

  final Book book;

  // ------------------------------- PROPERTIES --------------------------------

  @override
  State<DetailBorrowedBookPage> createState() => _DetailBorrowedBookPageState();
}

class _DetailBorrowedBookPageState extends State<DetailBorrowedBookPage> {
  // ----------------------------- FIELDS --------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    // TODO
    //format today date
    // String _todayBorrowDate =
    // DateFormat("E, dd-MM-yyyy").format(widget.book.borrowedDate);

    // TODO
    //add one month
    // DateTime _addOneMonthReturnDate = widget.book.borrowedDate.add(Duration(days: 30));
    // widget.book.returnDate = _addOneMonthReturnDate;

    // TODO
    //format return date
    // String _returnDate = DateFormat("E, dd-MM-yyyy").format(widget.book.returnDate);

    // TODO
    //remaining days
    // Duration difference = widget.book.returnDate.difference(widget.book.borrowedDate);
    // widget.book.remainingDays = difference.inDays.toString();
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO : cari camne nak load page list yg dh update terus(force reload)
              GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Icon(Icons.arrow_back)),
              SizedBox(height: 35),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                    SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.book.bookTitle ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 24),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.book.authorName ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
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
              SizedBox(height: 30),
              Text(
                'Borrowed Date:',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 15),
              // TODO
              Text(
                // _todayBorrowDate,
                '',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(height: 30),
              Text(
                'Return Date:',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 15),
              // TODO
              Text(
                // _returnDate,
                '',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(height: 30),
              Text(
                'Remaining Days:',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                '${widget.book.remainingDays} days left',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              Expanded(child: SizedBox(height: 35)),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      myBooks.remove(widget.book);
                    });
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
                    child: Center(
                      child: const Text('RETURN',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.2,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
