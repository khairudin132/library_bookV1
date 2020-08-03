import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/widget/carousel.dart';
import 'package:toast/toast.dart';

Book bookDesc = Book();
Carousel bookCategory = Carousel();

class DetailBorrowedBook extends StatefulWidget {
  Book _book;

  DetailBorrowedBook(Book book) {
    _book = book;
  }

  @override
  _DetailBorrowedBookState createState() => _DetailBorrowedBookState(_book);
}

class _DetailBorrowedBookState extends State<DetailBorrowedBook> {
  Book book;

  _DetailBorrowedBookState(Book book) {
    this.book = book;
  }

  @override
  Widget build(BuildContext context) {
    //format today date
    String _todayBorrowDate =
        DateFormat("E, dd-MM-yyyy").format(book.borrowedDate);

    //add one month
    DateTime _addOneMonthReturnDate = book.borrowedDate.add(Duration(days: 30));
    book.returnDate = _addOneMonthReturnDate;

    //format return date
    String _returnDate = DateFormat("E, dd-MM-yyyy").format(book.returnDate);

    //remaining days
    Duration difference = book.returnDate.difference(book.borrowedDate);
    book.remainingDays = difference.inDays.toString();
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
                          child: Image.asset(book.image, fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.bookTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 24),
                          ),
                          SizedBox(height: 5),
                          Text(
                            book.authorName,
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
              Text(
                _todayBorrowDate,
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
              Text(
                _returnDate,
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
                '${book.remainingDays} days left',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              Expanded(child: SizedBox(height: 35)),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      myBooks.remove(book);
                    });
                    Toast.show("Thank you!", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
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
