import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/model/user.dart';

class Database {
  final Firestore _firestore = Firestore.instance;
  List<Book> borrowedBook = List();

  //untuk cari current userid

//  UsersList() async {
//    List userId = await _firestore
//        .collection("masters")
//        .getDocuments()
//        .then((val) => val.documents);
//    for (int i = 0; i < userId.length; i++) {
//      Firestore.instance
//          .collection("masters")
//          .document(userId[i].documentID.toString())
//          .collection("courses")
//          .snapshots()
//          .listen(CreateListofBook);
//    }
//  }

//  CreateListofBook(QuerySnapshot snapshot) async {
//    var docs = snapshot.documents;
//    for (var Doc in docs) {
//      borrowedBook.add(Book.fromDocumentSnapshot());
//    }
//  }

  Future<String> createUser(User user) async {
    String returnVal = 'error';

    try {
      await _firestore.collection('users').document(user.uid).setData({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });

      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> createBorrowedBookInfo(String userId, Book book) async {
    String returnVal = 'error';
    try {
      borrowedBook.add(book);
      await _firestore
          .collection('users')
          .document('E4sywYbLB1cdNM6sFFiBgmR0Rjo1')
          .collection('borrowed book')
          .add({
        'book title': book.bookTitle.trim(),
        'image': book.image,
        'author': book.authorName.trim(),
        'borrowed date': Timestamp.now(),
        'return date': book.returnDate,
      });

      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<Book> getBookInfo(String userName, String bookId) async {
    Book returnVal = Book();

    try {
      DocumentSnapshot _docSnapshot = await _firestore
          .collection('users')
          .document(userName)
          .collection('borrowed book')
          .document(bookId)
          .get();
      returnVal.bookId = bookId;
      returnVal.bookTitle = _docSnapshot.data['book title'];
      returnVal.authorName = _docSnapshot.data['author'];
      returnVal.image = _docSnapshot.data['image'];
      returnVal.borrowedDate = _docSnapshot.data['borrow date'];
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<User> getUserInfo(String uid) async {
    User returnVal = User();

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection('users').document(uid).get();
      returnVal.uid = uid;
      returnVal.fullName = _docSnapshot.data['fullName'];
      returnVal.email = _docSnapshot.data['email'];
      returnVal.accountCreated = _docSnapshot.data['accountCreated'];
    } catch (e) {
      print(e);
    }
    return returnVal;
  }
}
