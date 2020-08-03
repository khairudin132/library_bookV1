import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String bookId;
  int id;
  String bookTitle;
  String authorName;
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra, luctus nisi ac, semper enim. Vestibulum in mi feugiat, mattis erat suscipit, fermentum quam. Mauris non urna sed odio congue rhoncus. \nAliquam a dignissim ex. Suspendisse et sem porta, consequat dui et, placerat tortor. Sed elementum nunc a blandit euismod. Cras condimentum faucibus dolor. Etiam interdum egestas sagittis. Aliquam vitae molestie eros. Cras porta felis ac eros pellentesque, sed lobortis mi eleifend. Praesent ut.';
  int available;
  String image;
  DateTime borrowedDate;
  DateTime returnDate;
  String remainingDays;

  Book({
    this.bookId,
    this.id,
    this.bookTitle,
    this.authorName,
    this.available,
    this.image,
    this.borrowedDate,
    this.returnDate,
    this.remainingDays,
  });

//  Book.fromDocumentSnapshot({DocumentSnapshot doc}) {
//    bookId = doc.documentID;
//    bookTitle = doc.data["book title"];
//    authorName = doc.data["author"];
//    image = doc.data["image"];
//    borrowedDate = doc.data['borrow date'];
//  }
}

final List<Book> mostBorrowed = [
  Book(
    id: 1,
    bookTitle: 'CorelDraw untuk Tingkat Pemula Sampai Mahir',
    authorName: 'Jubilee Enterprise',
    image: 'images/corel.jpg',
    available: 7,
  ),
  Book(
    id: 2,
    bookTitle: 'Buku Pintar Drafter Untuk Pemula Hingga Mahir',
    authorName: 'Widada',
    image: 'images/drafter.jpg',
    available: 7,
  ),
  Book(
    id: 3,
    bookTitle: 'Adobe InDesign: Seri Panduan Terlengkap',
    authorName: 'Jubilee Enterprise',
    image: 'images/corel.jpg',
    available: 7,
  ),
  Book(
    id: 4,
    bookTitle: 'Pemodelan Objek Dengan 3Ds Max 2014',
    authorName: 'Wahana Komputer',
    image: 'images/max_3d.jpeg',
    available: 7,
  ),
  Book(
    id: 5,
    bookTitle: 'Penerapan Visualisasi 3D Dengan Autodesk Maya',
    authorName: 'Dhani Ariatmanto',
    image: 'images/maya.jpeg',
    available: 7,
  ),
  Book(
    id: 6,
    bookTitle: 'Teknik Lancar Menggunakan Adobe Photoshop',
    authorName: 'Jubilee Enterprise',
    image: 'images/photoshop.jpg',
    available: 7,
  ),
];

final List<Book> mostPopular = [
  Book(
    id: 7,
    bookTitle: 'Webmaster Series : Trik Cepat Menguasai CSS',
    authorName: 'Wahana Komputer',
    image: 'images/webmaster.jpeg',
    available: 7,
  ),
  Book(
    id: 8,
    bookTitle: 'Cad Series : Google Sketchup Untuk Desain 3D',
    authorName: 'Wahana Komputer',
    image: 'images/sketchup.jpeg',
    available: 7,
  ),
  Book(
    id: 9,
    bookTitle: 'Adobe Premiere Terlengkap dan Termudah',
    authorName: 'Jubilee Enterprise',
    image: 'images/premier.jpg',
    available: 7,
  ),
  Book(
    id: 10,
    bookTitle: 'Pemodelan Objek Dengan 3Ds Max 2014',
    authorName: 'Wahana Komputer',
    image: 'images/max_3d.jpeg',
    available: 7,
  ),
  Book(
    id: 11,
    bookTitle: 'Penerapan Visualisasi 3D Dengan Autodesk Maya',
    authorName: 'Dhani Ariatmanto',
    image: 'images/maya.jpeg',
    available: 7,
  ),
  Book(
    id: 12,
    bookTitle: 'Teknik Lancar Menggunakan Adobe Photoshop',
    authorName: 'Jubilee Enterprise',
    image: 'images/photoshop.jpg',
    available: 7,
  ),
];

final List<Book> myBooks = [];
