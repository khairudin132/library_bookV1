//use this to appear bottom sheet

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_book/model/book.dart';

class BottomSheetModal extends StatefulWidget {
  Book _book;

  BottomSheetModal(Book book) {
    _book = book;
  }

  @override
  _BottomSheetModalState createState() => _BottomSheetModalState(_book);
}

class _BottomSheetModalState extends State<BottomSheetModal> {
  Book book;

  _BottomSheetModalState(Book book) {
    this.book = book;
  }

  //Date time picker
//  Future<Null> _selectdate(BuildContext context) async {
//    final DateTime _seldate = await showDatePicker(
//        context: context,
//        initialDate: _currentdate,
//        firstDate: DateTime(2020),
//        lastDate: DateTime(2026),
//        builder: (context, child) {
//          return SingleChildScrollView(
//            child: child,
//          );
//        });
//    if (_seldate != null) {
//      setState(() {
//        _currentdate = _seldate;
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return mainBottomSheet(context);
  }

  mainBottomSheet(BuildContext context) {
    DateTime _todayBorrowBook = DateTime.now();
    book.borrowedDate = _todayBorrowBook;

    //format today date
    String _todayBorrowDate =
        DateFormat("E, dd-MM-yyyy").format(book.borrowedDate);

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //borrow date
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54, width: 1.5),
                    ),
                    child: Center(
                        child: Text(
                      _todayBorrowDate,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                        fontSize: 20,
                        letterSpacing: 1.2,
                      ),
                    ))),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    hintText: 'Return date',
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.lime, width: 1),
                    ),
                    child: Center(
                        child: Text(
                      'PROCEED',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.lime,
                        fontSize: 20,
                        letterSpacing: 1.2,
                      ),
                    ))),
              ],
            ),
          );
        });
  }

  //Date time picker function into textformfield
//  mainBottomSheet(BuildContext context) {
//    String _formattedate = new DateFormat.yMd().format(_currentdate);
//    showModalBottomSheet(
//        context: context,
//        builder: (BuildContext context) {
//          return Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                TextFormField(
//                  onTap: () {
//                    // Below line stops keyboard from appearing
//                    FocusScope.of(context).requestFocus(new FocusNode());
//                    _selectdate(context);
//                  },
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.calendar_today),
//                    hintText: 'Borrow Date',
//                  ),
//                ),
//                SizedBox(height: 20),
//                TextFormField(
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.date_range),
//                    hintText: 'Return date',
//                  ),
//                ),
//                SizedBox(height: 20),
//                Divider(
//                  height: 1,
//                  thickness: 1.5,
//                ),
//                SizedBox(height: 20),
//                Container(
//                    width: double.infinity,
//                    padding: const EdgeInsets.symmetric(vertical: 16.0),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(10),
//                      border: Border.all(color: Colors.lime, width: 1),
//                    ),
//                    child: Center(
//                        child: Text(
//                      'PROCEED',
//                      style: TextStyle(
//                        fontWeight: FontWeight.w600,
//                        color: Colors.lime,
//                        fontSize: 20,
//                        letterSpacing: 1.2,
//                      ),
//                    ))),
//              ],
//            ),
//          );
//        });
//  }

}
