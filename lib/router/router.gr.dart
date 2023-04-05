// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:library_book/model/model.dart' as _i9;
import 'package:library_book/screens/book_description/page.dart' as _i6;
import 'package:library_book/screens/detail_borrowed_book/page.dart' as _i3;
import 'package:library_book/screens/home/page.dart' as _i1;
import 'package:library_book/screens/list_borrowed_book/page.dart' as _i4;
import 'package:library_book/screens/login/page.dart' as _i5;
import 'package:library_book/screens/signup/page.dart' as _i2;

abstract class $LibraryRouter extends _i7.RootStackRouter {
  $LibraryRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpPage(),
      );
    },
    DetailBorrowedBookPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailBorrowedBookPageRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DetailBorrowedBookPage(
          key: args.key,
          book: args.book,
        ),
      );
    },
    ListBorrowedBookPageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ListBorrowedBookPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    BookDescriptionPageRoute.name: (routeData) {
      final args = routeData.argsAs<BookDescriptionPageRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.BookDescriptionPage(
          key: args.key,
          book: args.book,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i7.PageRouteInfo<void> {
  const HomePageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpPageRoute extends _i7.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DetailBorrowedBookPage]
class DetailBorrowedBookPageRoute
    extends _i7.PageRouteInfo<DetailBorrowedBookPageRouteArgs> {
  DetailBorrowedBookPageRoute({
    _i8.Key? key,
    required _i9.BookModel book,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DetailBorrowedBookPageRoute.name,
          args: DetailBorrowedBookPageRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailBorrowedBookPageRoute';

  static const _i7.PageInfo<DetailBorrowedBookPageRouteArgs> page =
      _i7.PageInfo<DetailBorrowedBookPageRouteArgs>(name);
}

class DetailBorrowedBookPageRouteArgs {
  const DetailBorrowedBookPageRouteArgs({
    this.key,
    required this.book,
  });

  final _i8.Key? key;

  final _i9.BookModel book;

  @override
  String toString() {
    return 'DetailBorrowedBookPageRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [_i4.ListBorrowedBookPage]
class ListBorrowedBookPageRoute extends _i7.PageRouteInfo<void> {
  const ListBorrowedBookPageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ListBorrowedBookPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListBorrowedBookPageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginPageRoute extends _i7.PageRouteInfo<void> {
  const LoginPageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.BookDescriptionPage]
class BookDescriptionPageRoute
    extends _i7.PageRouteInfo<BookDescriptionPageRouteArgs> {
  BookDescriptionPageRoute({
    _i8.Key? key,
    required _i9.BookModel book,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          BookDescriptionPageRoute.name,
          args: BookDescriptionPageRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'BookDescriptionPageRoute';

  static const _i7.PageInfo<BookDescriptionPageRouteArgs> page =
      _i7.PageInfo<BookDescriptionPageRouteArgs>(name);
}

class BookDescriptionPageRouteArgs {
  const BookDescriptionPageRouteArgs({
    this.key,
    required this.book,
  });

  final _i8.Key? key;

  final _i9.BookModel book;

  @override
  String toString() {
    return 'BookDescriptionPageRouteArgs{key: $key, book: $book}';
  }
}
