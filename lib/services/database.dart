import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_book/model/book.dart';
import 'package:library_book/model/user.dart';

class Database {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  List<Book> borrowedBook = [];

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

  Future<String> createUser(UserModel user) async {
    String returnVal = 'error';

    try {
      await _fireStore.collection('users').doc(user.id).set({
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
      await _fireStore
          .collection('users')
          .doc('E4sywYbLB1cdNM6sFFiBgmR0Rjo1')
          .collection('borrowed book')
          .add({
        'book title': book.bookTitle?.trim(),
        'image': book.image,
        'author': book.authorName?.trim(),
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
      DocumentSnapshot _docSnapshot = await _fireStore
          .collection('users')
          .doc(userName)
          .collection('borrowed book')
          .doc(bookId)
          .get();

      returnVal.copyWith(
        id: int.parse(bookId),
        bookTitle: _docSnapshot['book title'],
        authorName: _docSnapshot['author'],
        image: _docSnapshot['image'],
        borrowedDate: _docSnapshot['borrow date'],
      );
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<UserModel> getUserInfo(String uid) async {
    UserModel returnVal = UserModel();

    try {
      DocumentSnapshot _docSnapshot =
          await _fireStore.collection('users').doc(uid).get();

      returnVal.copyWith(
        id: uid,
        fullName: _docSnapshot['fullName'],
        email: _docSnapshot['email'],
        accountCreated: _docSnapshot['accountCreated'],
      );
    } catch (e) {
      print(e);
    }
    return returnVal;
  }
}
